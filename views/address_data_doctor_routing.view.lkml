view: address_data_doctor_routing {
  sql_table_name: `cloudadopt.carelon_doctor_routing.address_data_doctor_routing` ;;

### ID

  dimension: trip_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.trip_id ;;
  }

### Start

  dimension: start_address {
    group_label: "Start"
    type: string
    sql: ${TABLE}.start_address ;;
  }

  dimension: start_lat {
    group_label: "Start"
    type: number
    sql: ${TABLE}.start_lat ;;
  }

  dimension: start_long {
    group_label: "Start"
    type: number
    sql: ${TABLE}.start_long ;;
  }

  dimension: start_station_id {
    group_label: "Start"
    type: number
    sql: ${TABLE}.start_station_id ;;
  }

  dimension: start_provider_patient {
    group_label: "Start"
    type: string
    sql:
      case
        when ${start_station_id} = 0 then 'Provider'
        else 'Patient'
      end
    ;;
  }

  dimension: start_location {
    group_label: "Start"
    type: location
    sql_latitude: ${start_lat} ;;
    sql_longitude: ${start_long} ;;
  }

### End

  dimension: end_address {
    group_label: "End"
    type: string
    sql: ${TABLE}.end_address ;;
  }

  dimension: end_lat {
    group_label: "End"
    type: number
    sql: ${TABLE}.end_lat ;;
  }

  dimension: end_long {
    group_label: "End"
    type: number
    sql: ${TABLE}.end_long ;;
  }

  dimension: end_station_id {
    group_label: "End"
    type: number
    sql: ${TABLE}.end_station_id ;;
  }

  dimension: end_provider_patient {
    group_label: "End"
    type: string
    sql:
      case
        when ${end_station_id} = 0 then 'Provider'
        else 'Patient'
      end
    ;;
  }

  dimension: end_location {
    group_label: "End"
    type: location
    sql_latitude: ${end_lat} ;;
    sql_longitude: ${end_long} ;;
  }

  measure: count {
    type: count
  }

  measure: avg_trip_id {
    type: average
    sql: ${trip_id} ;;
  }
}
