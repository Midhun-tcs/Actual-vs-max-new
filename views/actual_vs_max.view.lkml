view: test_actual_vs_max {
  sql_table_name: Looker_Dashboard.Actual_vs_Max ;;

  dimension: bops_sdd_units_inprocess {
    type: number
    hidden: yes
    sql: ${TABLE}.BOPS_SDD_Units_Inprocess ;;
  }

  dimension: bops_sdd_units_not_ready {
    type: number
    hidden: yes
    sql: ${TABLE}.BOPS_SDD_Units_Not_Ready ;;
  }

  dimension: bops_sdd_units_printed {
    type: number
    hidden: yes
    sql: ${TABLE}.BOPS_SDD_Units_Printed ;;
  }

  dimension: curr_loc_fk {
    type: number
    primary_key: yes
    sql: ${TABLE}.curr_loc_fk ;;
  }

  dimension: fill_loc_fk {
    type: number
    sql: ${TABLE}.fill_loc_fk ;;
  }

  dimension: resv_nbr {
    type: number
    sql: ${TABLE}.resv_nbr ;;
  }

  dimension: shippable_in_process {
    type: number
    hidden: yes
    sql: ${TABLE}.Shippable_In_Process ;;
  }

  dimension: shippable_printed {
    type: number
    hidden: yes
    sql: ${TABLE}.Shippable_Printed ;;
  }

  dimension: shippable_unshipped {
    type: number
    hidden: yes
    sql: ${TABLE}.Shippable_Unshipped ;;
  }

  dimension: shippable_unshipped_dedicated_fulfillment {
    type: number
    hidden: yes
    sql: ${TABLE}.Shippable_Unshipped_Dedicated_Fulfillment ;;
  }

  dimension_group: shpmnt_by_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shpmnt_by_ts ;;
  }

  dimension_group: shpmnt_cnfrm_ts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.shpmnt_cnfrm_ts ;;
  }

  dimension: strategic_loc_indicator {
    type: yesno
    sql: ${TABLE}.Strategic_LOC_Indicator ;;
  }

  dimension: strategic_upc_indicator {
    type: yesno
    sql: ${TABLE}.Strategic_UPC_Indicator ;;
  }

  measure: bops_units_inprocess {
    type: sum
    sql: ${TABLE}.BOPS_SDD_Units_Inprocess ;;
    drill_fields: [location.Region,location.District,location.Store,bops_units_inprocess]
  }

  measure: bops_units_not_ready {
    type: sum
    sql: ${TABLE}.BOPS_SDD_Units_Not_Ready ;;
    drill_fields: [location.Region,location.District,location.Store,bops_units_not_ready]
  }

  measure: bops_units_printed {
    type: sum
    sql: ${TABLE}.BOPS_SDD_Units_Printed ;;
    drill_fields: [location.Region,location.District,location.Store,bops_units_printed]
  }
  measure: shippabl_in_process {
    type: sum
    sql: ${TABLE}.Shippable_In_Process ;;
    drill_fields: [location.Region,location.District,location.Store,shippabl_in_process]
  }

  measure: shippabl_printed {
    type: sum
    sql: ${TABLE}.Shippable_Printed ;;
    drill_fields: [location.Region,location.District,location.Store,shippabl_printed]
  }

  measure: shippabl_unshipped {
    type: sum
    sql: ${TABLE}.Shippable_Unshipped ;;
    drill_fields: [location.Region,location.District,location.Store,shippabl_unshipped]
  }

  measure: shippabl_unshipped_dedicated_fulfillment {
    type: sum
    sql: ${TABLE}.Shippable_Unshipped_Dedicated_Fulfillment ;;
    drill_fields: [location.Region,location.District,location.Store,shippabl_unshipped_dedicated_fulfillment]
  }
  measure: max_pick_percent {
    type: number
    sql: 100*${shippabl_in_process}/${location.max_pick} ;;
    value_format: "0.00%"
    drill_fields: [location.Region,location.District,location.Store]
  }
  measure: operational_max_pick_percent {
    type: number
    sql: 100*${shippabl_in_process}/${location.oper_max_pick} ;;
    value_format: "0.00%"
    drill_fields: [location.Region,location.District,location.Store]
  }
}
