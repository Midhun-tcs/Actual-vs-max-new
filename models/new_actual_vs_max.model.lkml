connection: "lok_db_obi"

# include all the views
include: "/views/**/*.view"

datagroup: new_actual_vs_max_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: new_actual_vs_max_default_datagroup

explore: location {}

explore: test_actual_vs_max {
  join: location {
    type: left_outer
    relationship: many_to_one
    sql_on: ${test_actual_vs_max.curr_loc_fk}=${location.locn_sk} ;;
  }
}
