view: image_model_input_5 {

  sql_table_name: `cloudadopt.dicom_mammography.image_model_input_5` ;;
  drill_fields: [id]

  dimension: pk {
    primary_key: yes
    type: string
    sql: ${id} || '|' || ${id_neighbor} || '|' || ${measurement}  ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: dot_product {
    type: number
    sql: ${TABLE}.dot_product ;;
  }

  dimension: dot_product10 {
    type: number
    sql: ${TABLE}.dot_product10 ;;
  }

  dimension: dot_product100 {
    type: number
    sql: ${TABLE}.dot_product100 ;;
  }

  dimension: id_neighbor {
    type: number
    sql: ${TABLE}.id_neighbor ;;
  }

  dimension: measurement {
    type: string
    sql: ${TABLE}.measurement ;;
  }

  dimension: rank_neighbor {
    type: number
    sql: ${TABLE}.rank_neighbor ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  dimension: value_neighbor {
    type: string
    sql: ${TABLE}.value_neighbor ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: avg_dp {
    type: average
    sql: ${dot_product} ;;
  }
  measure: avg_dp10 {
    type: average
    sql: ${dot_product10} ;;
  }
  measure: avg_dp100 {
    type: average
    sql: ${dot_product100} ;;
  }


}