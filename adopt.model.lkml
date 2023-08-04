connection: "z_asw_argolis_adopt"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: image_model_input_5 {
  label: "Medical Image - Mammograms"
}

explore: address_data_doctor_routing {
  label: "Doctor Routing"
}
