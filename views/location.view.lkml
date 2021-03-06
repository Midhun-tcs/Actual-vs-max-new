view: location {
  sql_table_name: Looker_Dashboard.Location ;;

  dimension: District {
    type: string
    sql: ${TABLE}.dist_desc ;;
  }

  dimension: Division {
    type: string
    sql: ${TABLE}.divn_name ;;
  }

  dimension: Store {
    type: string
    sql: ${TABLE}.divn_str_name ;;
  }

  dimension: locn_nm {
    type: string
    sql: ${TABLE}.locn_nm ;;
  }

  dimension: locn_sk {
    type: number
    primary_key: yes
    sql: ${TABLE}.locn_sk ;;
  }

  dimension: max_picks {
    type: number
    sql: ${TABLE}.max_picks ;;
  }

  dimension: ops_max_picks {
    type: number
    sql: ${TABLE}.ops_max_picks ;;
  }

  dimension: state_cd {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state_cd ;;
  }

  dimension: Region {
    type: string
    sql: ${TABLE}.sub_rgn_desc ;;
  }

  measure: max_pick {
    type: sum_distinct
    sql: ${max_picks} ;;
    drill_fields: [Region]
  }
  measure: oper_max_pick {
    type: sum_distinct
    sql: ${ops_max_picks} ;;
    drill_fields: [Region]
  }
}
