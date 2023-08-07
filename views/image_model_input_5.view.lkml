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
    group_label: "Z"
    type: number
    sql: ${TABLE}.dot_product ;;
  }

  dimension: dot_product10 {
    group_label: "Z"
    type: number
    sql: ${TABLE}.dot_product10 ;;
  }

  dimension: dot_product100 {
    group_label: "Z"
    type: number
    sql: ${TABLE}.dot_product100 ;;
  }

  dimension: id_neighbor {
    group_label: "Z"
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
    label: "Predicted Value"
    type: string
    sql: ${TABLE}.value_neighbor ;;
  }

  dimension: is_same {
    type: yesno
    sql: ${value} = ${value_neighbor} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  parameter: dp_num {
    type: unquoted
    default_value: "avg_dp100"
    allowed_value: {label: "DP" value: "avg_dp" }
    allowed_value: {label: "DP 10" value: "avg_dp10" }
    allowed_value: {label: "DP 100" value: "avg_dp100" }
  }

  measure: dp_dynamic {
    type: number
    sql:
      {% if    dp_num._parameter_value == 'avg_dp' %} ${avg_dp}
      {% elsif dp_num._parameter_value == 'avg_dp10' %} ${avg_dp10}
      {% elsif dp_num._parameter_value == 'avg_dp100' %} ${avg_dp100}
      {% else %} ${avg_dp}
      {% endif %}
    ;;
    value_format_name: percent_2
  }

  measure: avg_dp {
    type: average
    sql: ${dot_product} ;;
    value_format_name: percent_2
  }
  measure: avg_dp10 {
    type: average
    sql: ${dot_product10} ;;
    value_format_name: percent_2
  }
  measure: avg_dp100 {
    type: average
    sql: ${dot_product100} ;;
    value_format_name: percent_2
  }

  measure: dp_dynamic_same {
    type: number
    sql:
      {% if    dp_num._parameter_value == 'avg_dp' %} ${avg_dp_same}
      {% elsif dp_num._parameter_value == 'avg_dp10' %} ${avg_dp10_same}
      {% elsif dp_num._parameter_value == 'avg_dp100' %} ${avg_dp100_same}
      {% else %} ${avg_dp_same}
      {% endif %}
    ;;
    value_format_name: percent_2
  }

  measure: avg_dp_same {
    type: average
    sql: ${dot_product} ;;
    value_format_name: percent_2
    filters: [is_same: "Yes"]
  }
  measure: avg_dp10_same {
    type: average
    sql: ${dot_product10} ;;
    value_format_name: percent_2
    filters: [is_same: "Yes"]
  }
  measure: avg_dp100_same {
    type: average
    sql: ${dot_product100} ;;
    value_format_name: percent_2
    filters: [is_same: "Yes"]
  }

  measure: dp_dynamic_not_same {
    type: number
    sql:
      {% if    dp_num._parameter_value == 'avg_dp' %} ${avg_dp_not_same}
      {% elsif dp_num._parameter_value == 'avg_dp10' %} ${avg_dp10_not_same}
      {% elsif dp_num._parameter_value == 'avg_dp100' %} ${avg_dp100_not_same}
      {% else %} ${avg_dp_not_same}
      {% endif %}
    ;;
    value_format_name: percent_2
  }

  measure: avg_dp_not_same {
    type: average
    sql: ${dot_product} ;;
    value_format_name: percent_2
    filters: [is_same: "No"]
  }
  measure: avg_dp10_not_same {
    type: average
    sql: ${dot_product10} ;;
    value_format_name: percent_2
    filters: [is_same: "No"]
  }
  measure: avg_dp100_not_same {
    type: average
    sql: ${dot_product100} ;;
    value_format_name: percent_2
    filters: [is_same: "No"]
  }

  measure: dp_dynamic_difference {
    type: number
    sql: ${dp_dynamic_same} - ${dp_dynamic_not_same} ;;
    value_format_name: percent_2
  }


}
