resource "opsgenie_user" "olhadzundza" {
  username  = "olhadzundza@namecheap.com"
  full_name = "Olha Dzundza"
  role      = "User"
  id = var.opsgenie_user_olhadzundza_id
}

resource "opsgenie_user" "yuriyzhuha" {
  username  = "yuriyzhuha@namecheap.com"
  full_name = "Yuriy Zhuha"
  role      = "User"
  id = var.opsgenie_user_yuriyzhuha_id
}


resource "opsgenie_team" "SRE_L1" {
  name        = "SRE_L1_Assistant_Monitoring_Shift"
  description = "This team deals with alerts"

  member {
    username = "${opsgenie_user.olhadzundza}, ${opsgenie_user.yuriyzhuha}"
    role     = "user"
  }
}
