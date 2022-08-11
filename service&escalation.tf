resource "opsgenie_team" "killerwhales" {
  name        = "killerwhales@namecheap.com"
  description = "This team deals with domains"
  id =123456789
}

locals {
    recipient_id = "${var.opsgenie_user_olhadzundza_id}, ${var.opsgenie_user_yuriyzhuha_id}"
}

resource "opsgenie_service" "DomainsNC" {
  name  = "Domains"
  team_id = "${opsgenie_team.killerwhales.id}"
}


resource "opsgenie_escalation" "DomainsNC" {
  name          = "DomainsNC"
  description   = "test"
  owner_team_id = "${opsgenie_team.killerwhales.id}"

  rules {
    condition   = "if-not-acked"
    notify_type = "default"
    delay       = 10

    recipient {
      type = "user"
      id   = local.recipient_id
    }

/*
     recipient {
      type = "team"
      id   = "${opsgenie_team.test.id}"
    }

    recipient {
      type = "schedule"
      id   = "${opsgenie_schedule.test.id}"
    }
*/

  }

  repeat  {
    wait_interval          = 10
    count                  = 1
    reset_recipient_states = true
    close_alert_after_all  = false
  }
}
