locals {
  architecture = lower(var.architecture)
  product_name = lower(var.product_name)
  location     = lower(var.location)
  instance_id  = lower(var.instance_id)
  env          = lower(var.env)
  // Names based in the recomendations of
  // https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging
  az = {
    analysis_services_server = {
      name       = substr(join("", compact(["as", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = false
      slug       = "as"
      min_length = 3
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-z][a-z0-9]+$"
    }
    api_management = {
      name       = substr(join("", compact(["apim", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = false
      slug       = "apim"
      min_length = 1
      max_length = 50
      scope      = "global"
      regex      = "^[a-z][a-zA-Z0-9]+$"
    }
    app_configuration = {
      name       = substr(join("-", compact(["appcg", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "appcg"
      min_length = 5
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9_-]+$"
    }
    app_service = {
      name       = substr(join("-", compact(["app", local.product_name, local.location, local.instance_id, local.env])), 0, 60)
      dashes     = true
      slug       = "app"
      min_length = 2
      max_length = 60
      scope      = "global"
      regex      = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]"
    }
    app_service_environment = {
      name       = substr(join("-", compact(["ase", local.product_name, local.location, local.instance_id, local.env])), 0, 40)
      dashes     = true
      slug       = "ase"
      min_length = 1
      max_length = 40
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    app_service_plan = {
      name       = substr(join("-", compact(["plan", local.product_name, local.location, local.instance_id, local.env])), 0, 40)
      dashes     = true
      slug       = "plan"
      min_length = 1
      max_length = 40
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    application_gateway = {
      name       = substr(join("-", compact(["agw", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "agw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    application_insights = {
      name       = substr(join("-", compact(["appi", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "appi"
      min_length = 10
      max_length = 260
      scope      = "resourceGroup"
      regex      = "^[^%\\&?/]+$"
    }
    application_security_group = {
      name       = substr(join("-", compact(["asg", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "asg"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    automation_account = {
      name       = substr(join("-", compact(["aa", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "aa"
      min_length = 6
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    automation_certificate = {
      name       = substr(join("-", compact(["aacert", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "aacert"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }
    automation_credential = {
      name       = substr(join("-", compact(["aacred", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "aacred"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }
    automation_runbook = {
      name       = substr(join("-", compact(["aacred", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "aacred"
      min_length = 1
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+$"
    }
    automation_schedule = {
      name       = substr(join("-", compact(["aasched", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "aasched"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }
    automation_variable = {
      name       = substr(join("-", compact(["aavar", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "aavar"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }
    availability_set = {
      name       = substr(join("-", compact(["avail", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "avail"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+[a-zA-Z0-9_]$"
    }
    bastion_host = {
      name       = substr(join("-", compact(["snap", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "snap"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    batch_account = {
      name       = substr(join("", compact(["ba", local.product_name, local.location, local.instance_id, local.env])), 0, 24)
      dashes     = false
      slug       = "ba"
      min_length = 3
      max_length = 24
      scope      = "region"
      regex      = "^[a-z0-9]+$"
    }
    batch_application = {
      name       = substr(join("-", compact(["baapp", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "baapp"
      min_length = 1
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9_-]+$"
    }
    batch_certificate = {
      name       = substr(join("-", compact(["bacert", local.product_name, local.location, local.instance_id, local.env])), 0, 45)
      dashes     = true
      slug       = "bacert"
      min_length = 5
      max_length = 45
      scope      = "parent"
      regex      = "^[a-zA-Z0-9_-]+$"
    }
    batch_pool = {
      name       = substr(join("", compact(["bapool", local.product_name, local.location, local.instance_id, local.env])), 0, 24)
      dashes     = true
      slug       = "bapool"
      min_length = 3
      max_length = 24
      scope      = "parent"
      regex      = "^[a-zA-Z0-9_-]+$"
    }
    bot_channel_directline = {
      name       = substr(join("-", compact(["botline", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "botline"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }
    bot_channel_email = {
      name       = substr(join("-", compact(["botmail", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "botmail"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }
    bot_channel_ms_teams = {
      name       = substr(join("-", compact(["botteams", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "botteams"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }
    bot_channel_slack = {
      name       = substr(join("-", compact(["botslack", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "botslack"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }
    bot_channels_registration = {
      name       = substr(join("-", compact(["botchan", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "botchan"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }
    bot_connection = {
      name       = substr(join("-", compact(["botcon", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "botcon"
      min_length = 2
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }
    bot_web_app = {
      name       = substr(join("-", compact(["bot", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "bot"
      min_length = 2
      max_length = 64
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }
    cdn_endpoint = {
      name       = substr(join("-", compact(["cdn", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "cdn"
      min_length = 1
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    cdn_profile = {
      name       = substr(join("-", compact(["cdnprof", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "cdnprof"
      min_length = 1
      max_length = 260
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    cognitive_account = {
      name       = substr(join("-", compact(["cog", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "cog"
      min_length = 2
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+$"
    }
    container_group = {
      name       = substr(join("-", compact(["cg", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "cg"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    container_registry = {
      name       = substr(join("", compact(["acr", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = false
      slug       = "acr"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9]+$"
    }
    container_registry_webhook = {
      name       = substr(join("", compact(["crwh", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = false
      slug       = "crwh"
      min_length = 1
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9]+$"
    }
    cosmosdb_account = {
      name       = substr(join("-", compact(["cosmos", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "cosmos"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-z0-9][a-z0-9-_.]+[a-z0-9]$"
    }
    cosmosdb_postgres = {
      name       = substr(join("-", compact(["cospos", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "cospos"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-z0-9][a-z0-9-_.]+[a-z0-9]$"
    }
    custom_provider = {
      name       = substr(join("-", compact(["prov", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "prov"
      min_length = 3
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[^&%?\\/]+[^&%.?\\/ ]$"
    }
    dashboard = {
      name       = substr(join("-", compact(["dsb", local.product_name, local.location, local.instance_id, local.env])), 0, 160)
      dashes     = true
      slug       = "dsb"
      min_length = 3
      max_length = 160
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    data_factory = {
      name       = substr(join("-", compact(["adf", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "adf"
      min_length = 3
      max_length = 63
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    data_factory_dataset_mysql = {
      name       = substr(join("-", compact(["adfmysql", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "adfmysql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+[a-zA-Z0-9]$"
    }
    data_factory_dataset_postgresql = {
      name       = substr(join("-", compact(["adfpsql", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "adfpsql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+[a-zA-Z0-9]$"
    }
    data_factory_dataset_sql_server_table = {
      name       = substr(join("-", compact(["adfmssql", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "adfmssql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+[a-zA-Z0-9]$"
    }
    data_factory_integration_runtime_managed = {
      name       = substr(join("-", compact(["adfir", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "adfir"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    data_factory_linked_service_data_lake_storage_gen2 = {
      name       = substr(join("-", compact(["adfsvst", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "adfsvst"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }
    data_factory_linked_service_key_vault = {
      name       = substr(join("-", compact(["adfsvkv", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "adfsvkv"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }
    data_factory_linked_service_mysql = {
      name       = substr(join("-", compact(["adfsvmysql", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "adfsvmysql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }
    data_factory_linked_service_postgresql = {
      name       = substr(join("-", compact(["adfsvpsql", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "adfsvpsql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }
    data_factory_linked_service_sql_server = {
      name       = substr(join("-", compact(["adfsvmssql", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "adfsvmssql"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }
    data_factory_pipeline = {
      name       = substr(join("-", compact(["adfpl", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "adfpl"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+[a-zA-Z0-9]$"
    }
    data_factory_trigger_schedule = {
      name       = substr(join("-", compact(["adftg", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "adftg"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][^<>*%:.?\\+\\/]+$"
    }
    data_lake_analytics_account = {
      name       = substr(join("", compact(["dla", local.product_name, local.location, local.instance_id, local.env])), 0, 24)
      dashes     = false
      slug       = "dla"
      min_length = 3
      max_length = 24
      scope      = "global"
      regex      = "^[a-z0-9]+$"
    }
    data_lake_analytics_firewall_rule = {
      name       = substr(join("-", compact(["dlfw", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "dlfw"
      min_length = 3
      max_length = 50
      scope      = "parent"
      regex      = "^[a-z0-9-_]+$"
    }
    data_lake_store = {
      name       = substr(join("", compact(["dls", local.product_name, local.location, local.instance_id, local.env])), 0, 24)
      dashes     = false
      slug       = "dls"
      min_length = 3
      max_length = 24
      scope      = "parent"
      regex      = "^[a-z0-9]+$"
    }
    data_lake_store_firewall_rule = {
      name       = substr(join("-", compact(["dlsfw", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "dlsfw"
      min_length = 3
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    database_migration_project = {
      name       = substr(join("-", compact(["migr", local.product_name, local.location, local.instance_id, local.env])), 0, 57)
      dashes     = true
      slug       = "migr"
      min_length = 2
      max_length = 57
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }
    database_migration_service = {
      name       = substr(join("-", compact(["dms", local.product_name, local.location, local.instance_id, local.env])), 0, 62)
      dashes     = true
      slug       = "dms"
      min_length = 2
      max_length = 62
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+$"
    }
    databricks_cluster = {
      name       = substr(join("", compact(["dbc", local.product_name, local.location, local.instance_id, local.env])), 0, 30)
      dashes     = true
      slug       = "dbc"
      min_length = 3
      max_length = 30
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    databricks_high_concurrency_cluster = {
      name       = substr(join("", compact(["dbhcc", local.product_name, local.location, local.instance_id, local.env])), 0, 30)
      dashes     = true
      slug       = "dbhcc"
      min_length = 3
      max_length = 30
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    databricks_standard_cluster = {
      name       = substr(join("", compact(["dbsc", local.product_name, local.location, local.instance_id, local.env])), 0, 30)
      dashes     = true
      slug       = "dbsc"
      min_length = 3
      max_length = 30
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    databricks_workspace = {
      name       = substr(join("", compact(["dbw", local.product_name, local.location, local.instance_id, local.env])), 0, 30)
      dashes     = true
      slug       = "dbw"
      min_length = 3
      max_length = 30
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    dev_test_lab = {
      name       = substr(join("-", compact(["lab", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "lab"
      min_length = 1
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    dev_test_linux_virtual_machine = {
      name       = substr(join("-", compact(["labvm", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "labvm"
      min_length = 1
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    dev_test_windows_virtual_machine = {
      name       = substr(join("", compact(["labvm", local.product_name, local.location, local.instance_id, local.env])), 0, 15)
      dashes     = true
      slug       = "labvm"
      min_length = 1
      max_length = 15
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    disk_encryption_set = {
      name       = substr(join("-", compact(["des", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "des"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9_]+$"
    }
    dns_a_record = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    dns_aaaa_record = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    dns_caa_record = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    dns_cname_record = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    dns_mx_record = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    dns_ns_record = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    dns_ptr_record = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    dns_txt_record = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    dns_zone = {
      name       = substr(join("-", compact(["dns", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "dns"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    eventgrid_domain = {
      name       = substr(join("-", compact(["egd", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "egd"
      min_length = 3
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    eventgrid_domain_topic = {
      name       = substr(join("-", compact(["egdt", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "egdt"
      min_length = 3
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    eventgrid_event_subscription = {
      name       = substr(join("-", compact(["egs", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "egs"
      min_length = 3
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    eventgrid_topic = {
      name       = substr(join("-", compact(["egt", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "egt"
      min_length = 3
      max_length = 50
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    eventhub = {
      name       = substr(join("-", compact(["evh", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "evh"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    eventhub_authorization_rule = {
      name       = substr(join("-", compact(["ehar", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "ehar"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    eventhub_consumer_group = {
      name       = substr(join("-", compact(["ehcg", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "ehcg"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    eventhub_namespace = {
      name       = substr(join("-", compact(["ehn", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "ehn"
      min_length = 1
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    eventhub_namespace_authorization_rule = {
      name       = substr(join("-", compact(["ehnar", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "ehnar"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    eventhub_namespace_disaster_recovery_config = {
      name       = substr(join("-", compact(["ehdr", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "ehdr"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    express_route_circuit = {
      name       = substr(join("-", compact(["erc", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "erc"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    express_route_gateway = {
      name       = substr(join("-", compact(["ergw", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "ergw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    firewall = {
      name       = substr(join("-", compact(["fw", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "fw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    firewall_application_rule_collection = {
      name       = substr(join("-", compact(["fwapp", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "fwapp"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }
    firewall_ip_configuration = {
      name       = substr(join("-", compact(["fwipconf", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "fwipconf"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }
    firewall_nat_rule_collection = {
      name       = substr(join("-", compact(["fwnatrc", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "fwnatrc"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }
    firewall_network_rule_collection = {
      name       = substr(join("-", compact(["fwnetrc", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "fwnetrc"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }
    firewall_policy = {
      name       = substr(join("-", compact(["afwp", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "afwp"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    frontdoor = {
      name       = substr(join("-", compact(["fd", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "fd"
      min_length = 5
      max_length = 64
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    frontdoor_firewall_policy = {
      name       = substr(join("-", compact(["fdfw", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "fdfw"
      min_length = 1
      max_length = 80
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    function_app = {
      name       = substr(join("-", compact(["func", local.product_name, local.location, local.instance_id, local.env])), 0, 60)
      dashes     = true
      slug       = "func"
      min_length = 2
      max_length = 60
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    hdinsight_hadoop_cluster = {
      name       = substr(join("-", compact(["hadoop", local.product_name, local.location, local.instance_id, local.env])), 0, 59)
      dashes     = true
      slug       = "hadoop"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    hdinsight_hbase_cluster = {
      name       = substr(join("-", compact(["hbase", local.product_name, local.location, local.instance_id, local.env])), 0, 59)
      dashes     = true
      slug       = "hbase"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    hdinsight_interactive_query_cluster = {
      name       = substr(join("-", compact(["iqr", local.product_name, local.location, local.instance_id, local.env])), 0, 59)
      dashes     = true
      slug       = "iqr"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    hdinsight_kafka_cluster = {
      name       = substr(join("-", compact(["kafka", local.product_name, local.location, local.instance_id, local.env])), 0, 59)
      dashes     = true
      slug       = "kafka"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    hdinsight_ml_services_cluster = {
      name       = substr(join("-", compact(["mls", local.product_name, local.location, local.instance_id, local.env])), 0, 59)
      dashes     = true
      slug       = "mls"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    hdinsight_rserver_cluster = {
      name       = substr(join("-", compact(["rsv", local.product_name, local.location, local.instance_id, local.env])), 0, 59)
      dashes     = true
      slug       = "rsv"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    hdinsight_spark_cluster = {
      name       = substr(join("-", compact(["spark", local.product_name, local.location, local.instance_id, local.env])), 0, 59)
      dashes     = true
      slug       = "spark"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    hdinsight_storm_cluster = {
      name       = substr(join("-", compact(["storm", local.product_name, local.location, local.instance_id, local.env])), 0, 59)
      dashes     = true
      slug       = "storm"
      min_length = 3
      max_length = 59
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    image = {
      name       = substr(join("-", compact(["img", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "img"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+[a-zA-Z0-9_]$"
    }
    iotcentral_application = {
      name       = substr(join("-", compact(["iotapp", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "iotapp"
      min_length = 2
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }
    iothub = {
      name       = substr(join("-", compact(["iot", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "iot"
      min_length = 3
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }
    iothub_consumer_group = {
      name       = substr(join("-", compact(["iotcg", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "iotcg"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-._]+$"
    }
    iothub_dps = {
      name       = substr(join("-", compact(["dps", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "dps"
      min_length = 3
      max_length = 64
      scope      = "resoureceGroup"
      regex      = "^[a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    iothub_dps_certificate = {
      name       = substr(join("-", compact(["dpscert", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "dpscert"
      min_length = 1
      max_length = 64
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-._]+$"
    }
    key_vault = {
      name       = substr(join("", compact(["kv", local.product_name, local.location, local.instance_id, local.env])), 0, 24)
      dashes     = true
      slug       = "kv"
      min_length = 3
      max_length = 24
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    key_vault_certificate = {
      name       = substr(join("-", compact(["kvc", local.product_name, local.location, local.instance_id, local.env])), 0, 127)
      dashes     = true
      slug       = "kvc"
      min_length = 1
      max_length = 127
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    key_vault_key = {
      name       = substr(join("-", compact(["kvk", local.product_name, local.location, local.instance_id, local.env])), 0, 127)
      dashes     = true
      slug       = "kvk"
      min_length = 1
      max_length = 127
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    key_vault_secret = {
      name       = substr(join("-", compact(["kvs", local.product_name, local.location, local.instance_id, local.env])), 0, 127)
      dashes     = true
      slug       = "kvs"
      min_length = 1
      max_length = 127
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-]+$"
    }
    kubernetes_cluster = {
      name       = substr(join("-", compact(["aks", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "aks"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-_.]+[a-zA-Z0-9]$"
    }
    kusto_cluster = {
      name       = substr(join("", compact(["kc", local.product_name, local.location, local.instance_id, local.env])), 0, 22)
      dashes     = false
      slug       = "kc"
      min_length = 4
      max_length = 22
      scope      = "global"
      regex      = "^[a-z][a-z0-9]+$"
    }
    kusto_database = {
      name       = substr(join("-", compact(["kdb", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "kdb"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9- .]+$"
    }
    kusto_eventhub_data_connection = {
      name       = substr(join("-", compact(["kehc", local.product_name, local.location, local.instance_id, local.env])), 0, 40)
      dashes     = true
      slug       = "kehc"
      min_length = 1
      max_length = 40
      scope      = "parent"
      regex      = "^[a-zA-Z0-9- .]+$"
    }
    lb = {
      name       = substr(join("-", compact(["lb", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "lb"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    lb_nat_rule = {
      name       = substr(join("-", compact(["lbnatrl", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "lbnatrl"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    linux_virtual_machine = {
      name       = substr(join("-", compact(["vm", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "vm"
      min_length = 1
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }
    linux_virtual_machine_scale_set = {
      name       = substr(join("-", compact(["vmss", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "vmss"
      min_length = 1
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }
    load_testing_resource = {
      name       = substr(join("-", compact(["ltr", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "ltr"
      min_length = 1
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9_-]+$"
    }
    local_network_gateway = {
      name       = substr(join("-", compact(["lgw", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "lgw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    log_analytics_workspace = {
      name       = substr(join("-", compact(["log", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "log"
      min_length = 4
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    logic_app_workflow = {
      name       = substr(join("-", compact(["logic", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "logic"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    machine_learning_workspace = {
      name       = substr(join("-", compact(["mlw", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "mlw"
      min_length = 1
      max_length = 260
      scope      = "resourceGroup"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }
    managed_disk = {
      name       = substr(join("-", compact(["dsk", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "dsk"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9_]+$"
    }
    maps_account = {
      name       = substr(join("-", compact(["map", local.product_name, local.location, local.instance_id, local.env])), 0, 98)
      dashes     = true
      slug       = "map"
      min_length = 1
      max_length = 98
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+$"
    }
    mariadb_database = {
      name       = substr(join("-", compact(["mariadb", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "mariadb"
      min_length = 1
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    mariadb_firewall_rule = {
      name       = substr(join("-", compact(["mariafw", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "mariafw"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    mariadb_server = {
      name       = substr(join("-", compact(["maria", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "maria"
      min_length = 3
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }
    mariadb_virtual_network_rule = {
      name       = substr(join("-", compact(["mariavn", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "mariavn"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    monitor_action_group = {
      name       = substr(join("-", compact(["mag", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "mag"
      min_length = 1
      max_length = 260
      scope      = "resourceGroup"
      regex      = "^[^%&?\\+\\/]+[^^%&?\\+\\/ ]$"
    }
    monitor_autoscale_setting = {
      name       = substr(join("-", compact(["mas", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "mas"
      min_length = 1
      max_length = 260
      scope      = "resourceGroup"
      regex      = "^[^<>%&#.,?\\+\\/]+[^<>%&#.,?\\+\\/ ]$"
    }
    monitor_diagnostic_setting = {
      name       = substr(join("-", compact(["mds", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "mds"
      min_length = 1
      max_length = 260
      scope      = "resourceGroup"
      regex      = "^[^*<>%:&?\\+\\/]+[^*<>%:&?\\+\\/ ]$"
    }
    monitor_scheduled_query_rules_alert = {
      name       = substr(join("-", compact(["msqa", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "msqa"
      min_length = 1
      max_length = 260
      scope      = "resourceGroup"
      regex      = "^[^*<>%:{}&#.,?\\+\\/]+[^*<>%:{}&#.,?\\+\\/ ]$"
    }
    mssql_database = {
      name       = substr(join("-", compact(["sqldb", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "sqldb"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }
    mssql_elasticpool = {
      name       = substr(join("-", compact(["sqlep", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "sqlep"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }
    mssql_server = {
      name       = substr(join("-", compact(["sql", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "sql"
      min_length = 1
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }
    mysql_database = {
      name       = substr(join("-", compact(["mysqldb", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "mysqldb"
      min_length = 1
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    mysql_firewall_rule = {
      name       = substr(join("-", compact(["mysqlfw", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "mysqlfw"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    mysql_server = {
      name       = substr(join("-", compact(["mysql", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "mysql"
      min_length = 3
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }
    mysql_virtual_network_rule = {
      name       = substr(join("-", compact(["mysqlvn", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "mysqlvn"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    network_ddos_protection_plan = {
      name       = substr(join("-", compact(["ddospp", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "ddospp"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    network_interface = {
      name       = substr(join("-", compact(["nic", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "nic"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    network_security_group = {
      name       = substr(join("-", compact(["nsg", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "nsg"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    network_security_group_rule = {
      name       = substr(join("-", compact(["nsgr", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "nsgr"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    network_security_rule = {
      name       = substr(join("-", compact(["nsgr", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "nsgr"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    network_watcher = {
      name       = substr(join("-", compact(["nw", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "nw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    notification_hub = {
      name       = substr(join("-", compact(["nh", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "nh"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+$"
    }
    notification_hub_authorization_rule = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 256)
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 256
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+$"
    }
    notification_hub_namespace = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "dnsrec"
      min_length = 6
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    point_to_site_vpn_gateway = {
      name       = substr(join("-", compact(["vpngw", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "vpngw"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    postgresql_database = {
      name       = substr(join("-", compact(["psqldb", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "psqldb"
      min_length = 1
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    postgresql_firewall_rule = {
      name       = substr(join("-", compact(["psqlfw", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "psqlfw"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    postgresql_server = {
      name       = substr(join("-", compact(["psql", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "psql"
      min_length = 3
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-zA-Z0-9-]+[a-z0-9]$"
    }
    postgresql_virtual_network_rule = {
      name       = substr(join("-", compact(["psqlvn", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "psqlvn"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    powerbi_embedded = {
      name       = substr(join("-", compact(["pbi", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "pbi"
      min_length = 3
      max_length = 63
      scope      = "region"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+$"
    }
    private_dns_a_record = {
      name       = substr(join("-", compact(["pdnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    private_dns_aaaa_record = {
      name       = substr(join("-", compact(["pdnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    private_dns_cname_record = {
      name       = substr(join("-", compact(["pdnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    private_dns_mx_record = {
      name       = substr(join("-", compact(["pdnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    private_dns_ptr_record = {
      name       = substr(join("-", compact(["pdnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    private_dns_srv_record = {
      name       = substr(join("-", compact(["pdnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    private_dns_txt_record = {
      name       = substr(join("-", compact(["pdnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pdnsrec"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    private_dns_zone = {
      name       = substr(join("-", compact(["pdns", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "pdns"
      min_length = 1
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    private_dns_zone_group = {
      name       = substr(join("-", compact(["pdnszg", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pdnszg"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }
    private_endpoint = {
      name       = substr(join("-", compact(["pe", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pe"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }
    private_link_service = {
      name       = substr(join("-", compact(["pls", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pls"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    private_service_connection = {
      name       = substr(join("-", compact(["psc", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "psc"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9\\-\\._]+[a-zA-Z0-9_]$"
    }
    proximity_placement_group = {
      name       = substr(join("-", compact(["ppg", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "ppg"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    public_ip = {
      name       = substr(join("-", compact(["pip", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pip"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    public_ip_prefix = {
      name       = substr(join("-", compact(["pippf", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "pippf"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    recovery_services_vault = {
      name       = substr(join("-", compact(["rsv", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "rsv"
      min_length = 2
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    redis_cache = {
      name       = substr(join("-", compact(["redis", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "redis"
      min_length = 1
      max_length = 63
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    redis_firewall_rule = {
      name       = substr(join("", compact(["redisfw", local.product_name, local.location, local.instance_id, local.env])), 0, 256)
      dashes     = false
      slug       = "redisfw"
      min_length = 1
      max_length = 256
      scope      = "parent"
      regex      = "^[a-zA-Z0-9]+$"
    }
    relay_hybrid_connection = {
      name       = substr(join("-", compact(["rlhc", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "rlhc"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    relay_namespace = {
      name       = substr(join("-", compact(["rln", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "rln"
      min_length = 6
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    resource_group = {
      name       = substr(join("-", compact(["rg", local.product_name, local.location, local.instance_id, local.env])), 0, 90)
      dashes     = true
      slug       = "rg"
      min_length = 1
      max_length = 90
      scope      = "subscription"
      regex      = "^[a-zA-Z0-9-._\\(\\)]+[a-zA-Z0-9-_\\(\\)]$"
    }
    role_assignment = {
      name       = substr(join("-", compact(["ra", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "ra"
      min_length = 1
      max_length = 64
      scope      = "assignment"
      regex      = "^[^%]+[^ %.]$"
    }
    role_definition = {
      name       = substr(join("-", compact(["rd", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "rd"
      min_length = 1
      max_length = 64
      scope      = "definition"
      regex      = "^[^%]+[^ %.]$"
    }
    route = {
      name       = substr(join("-", compact(["rt", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "rt"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    route_table = {
      name       = substr(join("-", compact(["route", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "route"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    search_service = {
      name       = substr(join("-", compact(["srch", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "srch"
      min_length = 2
      max_length = 64
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+$"
    }
    service_fabric_cluster = {
      name       = substr(join("", compact(["sf", local.product_name, local.location, local.instance_id, local.env])), 0, 23)
      dashes     = true
      slug       = "sf"
      min_length = 4
      max_length = 23
      scope      = "region"
      regex      = "^[a-z][a-z0-9-]+[a-z0-9]$"
    }
    servicebus_namespace = {
      name       = substr(join("-", compact(["sb", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "sb"
      min_length = 6
      max_length = 50
      scope      = "global"
      regex      = "^[a-zA-Z][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    servicebus_namespace_authorization_rule = {
      name       = substr(join("-", compact(["sbar", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "sbar"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    servicebus_queue = {
      name       = substr(join("-", compact(["sbq", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "sbq"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    servicebus_queue_authorization_rule = {
      name       = substr(join("-", compact(["sbqar", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "sbqar"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    servicebus_subscription = {
      name       = substr(join("-", compact(["sbs", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "sbs"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    servicebus_subscription_rule = {
      name       = substr(join("-", compact(["sbsr", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "sbsr"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    servicebus_topic = {
      name       = substr(join("-", compact(["sbt", local.product_name, local.location, local.instance_id, local.env])), 0, 260)
      dashes     = true
      slug       = "sbt"
      min_length = 1
      max_length = 260
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    servicebus_topic_authorization_rule = {
      name       = substr(join("-", compact(["dnsrec", local.product_name, local.location, local.instance_id, local.env])), 0, 50)
      dashes     = true
      slug       = "dnsrec"
      min_length = 1
      max_length = 50
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    shared_image = {
      name       = substr(join("-", compact(["si", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "si"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9]$"
    }
    shared_image_gallery = {
      name       = substr(join("", compact(["sig", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = false
      slug       = "sig"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9.]+[a-zA-Z0-9]$"
    }
    signalr_service = {
      name       = substr(join("-", compact(["sgnlr", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "sgnlr"
      min_length = 3
      max_length = 63
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]$"
    }
    snapshots = {
      name       = substr(join("-", compact(["snap", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "snap"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    sql_elasticpool = {
      name       = substr(join("-", compact(["sqlep", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "sqlep"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:.?\\+\\/]+[^<>*%:.?\\+\\/ ]$"
    }
    sql_failover_group = {
      name       = substr(join("-", compact(["sqlfg", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "sqlfg"
      min_length = 1
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }
    sql_firewall_rule = {
      name       = substr(join("-", compact(["sqlfw", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "sqlfw"
      min_length = 1
      max_length = 128
      scope      = "parent"
      regex      = "^[^<>*%:?\\+\\/]+[^<>*%:.?\\+\\/]$"
    }
    sql_server = {
      name       = substr(join("-", compact(["sql", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "sql"
      min_length = 1
      max_length = 63
      scope      = "global"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }
    storage_account = {
      name       = substr(join("", compact(["st", local.product_name, local.location, local.instance_id, local.env])), 0, 24)
      dashes     = false
      slug       = "st"
      min_length = 3
      max_length = 24
      scope      = "global"
      regex      = "^[a-z0-9]+$"
    }
    storage_blob = {
      name       = substr(join("-", compact(["blob", local.product_name, local.location, local.instance_id, local.env])), 0, 1024)
      dashes     = true
      slug       = "blob"
      min_length = 1
      max_length = 1024
      scope      = "parent"
      regex      = "^[^\\s\\/$#&]+$"
    }
    storage_container = {
      name       = substr(join("-", compact(["stct", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "stct"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+$"
    }
    storage_data_lake_gen2_filesystem = {
      name       = substr(join("-", compact(["stdl", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "stdl"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }
    storage_queue = {
      name       = substr(join("-", compact(["stq", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "stq"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }
    storage_share = {
      name       = substr(join("-", compact(["sts", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "sts"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }
    storage_share_directory = {
      name       = substr(join("-", compact(["sts", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "sts"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }
    storage_table = {
      name       = substr(join("-", compact(["stt", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "stt"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-z0-9][a-z0-9-]+[a-z0-9]$"
    }
    stream_analytics_function_javascript_udf = {
      name       = substr(join("-", compact(["asafunc", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asafunc"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    stream_analytics_job = {
      name       = substr(join("-", compact(["asa", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asa"
      min_length = 3
      max_length = 63
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    stream_analytics_output_blob = {
      name       = substr(join("-", compact(["asaoblob", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asaoblob"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    stream_analytics_output_eventhub = {
      name       = substr(join("-", compact(["asaoeh", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asaoeh"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    stream_analytics_output_mssql = {
      name       = substr(join("-", compact(["asaomssql", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asaomssql"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    stream_analytics_output_servicebus_queue = {
      name       = substr(join("-", compact(["asaosbq", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asaosbq"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    stream_analytics_output_servicebus_topic = {
      name       = substr(join("-", compact(["asaosbt", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asaosbt"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    stream_analytics_reference_input_blob = {
      name       = substr(join("-", compact(["asarblob", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asarblob"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    stream_analytics_stream_input_blob = {
      name       = substr(join("-", compact(["asaiblob", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asaiblob"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    stream_analytics_stream_input_eventhub = {
      name       = substr(join("-", compact(["asaieh", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asaieh"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    stream_analytics_stream_input_iothub = {
      name       = substr(join("-", compact(["asaiiot", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "asaiiot"
      min_length = 3
      max_length = 63
      scope      = "parent"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    subnet = {
      name       = substr(join("-", compact(["snet", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "snet"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    template_deployment = {
      name       = substr(join("-", compact(["deploy", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "deploy"
      min_length = 1
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-._\\(\\)]+$"
    }
    traffic_manager_profile = {
      name       = substr(join("-", compact(["traf", local.product_name, local.location, local.instance_id, local.env])), 0, 63)
      dashes     = true
      slug       = "traf"
      min_length = 1
      max_length = 63
      scope      = "global"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-.]+[a-zA-Z0-9_]$"
    }
    user_assigned_identity = {
      name       = substr(join("-", compact(["uai", local.product_name, local.location, local.instance_id, local.env])), 0, 128)
      dashes     = true
      slug       = "uai"
      min_length = 3
      max_length = 128
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9-_]+$"
    }
    virtual_machine = {
      name       = substr(join("", compact(["vm", local.product_name, local.location, local.instance_id, local.env])), 0, 15)
      dashes     = true
      slug       = "vm"
      min_length = 1
      max_length = 15
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }
    virtual_machine_extension = {
      name       = substr(join("-", compact(["vmx", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "vmx"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    virtual_machine_scale_set = {
      name       = substr(join("", compact(["vmss", local.product_name, local.location, local.instance_id, local.env])), 0, 15)
      dashes     = true
      slug       = "vmss"
      min_length = 1
      max_length = 15
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }
    virtual_machine_scale_set_extension = {
      name       = substr(join("-", compact(["vmssx", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "vmssx"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    virtual_network = {
      name       = substr(join("-", compact(["vnet", local.product_name, local.location, local.instance_id, local.env])), 0, 64)
      dashes     = true
      slug       = "vnet"
      min_length = 2
      max_length = 64
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    virtual_network_gateway = {
      name       = substr(join("-", compact(["vng", local.architecture, local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "vng"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    virtual_network_gateway_connection = {
      name       = substr(join("-", compact(["vcn", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "vcn"
      min_length = 1
      max_length = 80
      scope      = "resourceGroup"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    virtual_network_peering = {
      name       = substr(join("-", compact(["vpeer", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "vpeer"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    virtual_wan = {
      name       = substr(join("-", compact(["vwan", local.product_name, local.location, local.instance_id, local.env])), 0, 80)
      dashes     = true
      slug       = "vwan"
      min_length = 1
      max_length = 80
      scope      = "parent"
      regex      = "^[a-zA-Z0-9][a-zA-Z0-9-._]+[a-zA-Z0-9_]$"
    }
    windows_virtual_machine = {
      name       = substr(join("-", compact(["vm", local.product_name, local.location, local.instance_id, local.env])), 0, 15)
      dashes     = true
      slug       = "vm"
      min_length = 1
      max_length = 15
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }
    windows_virtual_machine_scale_set = {
      name       = substr(join("", compact(["vmss", local.product_name, local.location, local.instance_id, local.env])), 0, 15)
      dashes     = true
      slug       = "vmss"
      min_length = 1
      max_length = 15
      scope      = "resourceGroup"
      regex      = "^[^\\/\"\\[\\]:|<>+=;,?*@&_][^\\/\"\\[\\]:|<>+=;,?*@&]+[^\\/\"\\[\\]:|<>+=;,?*@&.-]$"
    }
  }
  validation = {
    analysis_services_server = {
      valid_name = length(regexall(local.az.analysis_services_server.regex, local.az.analysis_services_server.name)) > 0 && length(local.az.analysis_services_server.name) > local.az.analysis_services_server.min_length
    }
    api_management = {
      valid_name = length(regexall(local.az.api_management.regex, local.az.api_management.name)) > 0 && length(local.az.api_management.name) > local.az.api_management.min_length
    }
    app_configuration = {
      valid_name = length(regexall(local.az.app_configuration.regex, local.az.app_configuration.name)) > 0 && length(local.az.app_configuration.name) > local.az.app_configuration.min_length
    }
    app_service = {
      valid_name = length(regexall(local.az.app_service.regex, local.az.app_service.name)) > 0 && length(local.az.app_service.name) > local.az.app_service.min_length
    }
    app_service_environment = {
      valid_name = length(regexall(local.az.app_service_environment.regex, local.az.app_service_environment.name)) > 0 && length(local.az.app_service_environment.name) > local.az.app_service_environment.min_length
    }
    app_service_plan = {
      valid_name = length(regexall(local.az.app_service_plan.regex, local.az.app_service_plan.name)) > 0 && length(local.az.app_service_plan.name) > local.az.app_service_plan.min_length
    }
    application_gateway = {
      valid_name = length(regexall(local.az.application_gateway.regex, local.az.application_gateway.name)) > 0 && length(local.az.application_gateway.name) > local.az.application_gateway.min_length
    }
    application_insights = {
      valid_name = length(regexall(local.az.application_insights.regex, local.az.application_insights.name)) > 0 && length(local.az.application_insights.name) > local.az.application_insights.min_length
    }
    application_security_group = {
      valid_name = length(regexall(local.az.application_security_group.regex, local.az.application_security_group.name)) > 0 && length(local.az.application_security_group.name) > local.az.application_security_group.min_length
    }
    automation_account = {
      valid_name = length(regexall(local.az.automation_account.regex, local.az.automation_account.name)) > 0 && length(local.az.automation_account.name) > local.az.automation_account.min_length
    }
    automation_certificate = {
      valid_name = length(regexall(local.az.automation_certificate.regex, local.az.automation_certificate.name)) > 0 && length(local.az.automation_certificate.name) > local.az.automation_certificate.min_length
    }
    automation_credential = {
      valid_name = length(regexall(local.az.automation_credential.regex, local.az.automation_credential.name)) > 0 && length(local.az.automation_credential.name) > local.az.automation_credential.min_length
    }
    automation_runbook = {
      valid_name = length(regexall(local.az.automation_runbook.regex, local.az.automation_runbook.name)) > 0 && length(local.az.automation_runbook.name) > local.az.automation_runbook.min_length
    }
    automation_schedule = {
      valid_name = length(regexall(local.az.automation_schedule.regex, local.az.automation_schedule.name)) > 0 && length(local.az.automation_schedule.name) > local.az.automation_schedule.min_length
    }
    automation_variable = {
      valid_name = length(regexall(local.az.automation_variable.regex, local.az.automation_variable.name)) > 0 && length(local.az.automation_variable.name) > local.az.automation_variable.min_length
    }
    availability_set = {
      valid_name = length(regexall(local.az.availability_set.regex, local.az.availability_set.name)) > 0 && length(local.az.availability_set.name) > local.az.availability_set.min_length
    }
    bastion_host = {
      valid_name = length(regexall(local.az.bastion_host.regex, local.az.bastion_host.name)) > 0 && length(local.az.bastion_host.name) > local.az.bastion_host.min_length
    }
    batch_account = {
      valid_name = length(regexall(local.az.batch_account.regex, local.az.batch_account.name)) > 0 && length(local.az.batch_account.name) > local.az.batch_account.min_length
    }
    batch_application = {
      valid_name = length(regexall(local.az.batch_application.regex, local.az.batch_application.name)) > 0 && length(local.az.batch_application.name) > local.az.batch_application.min_length
    }
    batch_certificate = {
      valid_name = length(regexall(local.az.batch_certificate.regex, local.az.batch_certificate.name)) > 0 && length(local.az.batch_certificate.name) > local.az.batch_certificate.min_length
    }
    batch_pool = {
      valid_name = length(regexall(local.az.batch_pool.regex, local.az.batch_pool.name)) > 0 && length(local.az.batch_pool.name) > local.az.batch_pool.min_length
    }
    bot_channel_directline = {
      valid_name = length(regexall(local.az.bot_channel_directline.regex, local.az.bot_channel_directline.name)) > 0 && length(local.az.bot_channel_directline.name) > local.az.bot_channel_directline.min_length
    }
    bot_channel_email = {
      valid_name = length(regexall(local.az.bot_channel_email.regex, local.az.bot_channel_email.name)) > 0 && length(local.az.bot_channel_email.name) > local.az.bot_channel_email.min_length
    }
    bot_channel_ms_teams = {
      valid_name = length(regexall(local.az.bot_channel_ms_teams.regex, local.az.bot_channel_ms_teams.name)) > 0 && length(local.az.bot_channel_ms_teams.name) > local.az.bot_channel_ms_teams.min_length
    }
    bot_channel_slack = {
      valid_name = length(regexall(local.az.bot_channel_slack.regex, local.az.bot_channel_slack.name)) > 0 && length(local.az.bot_channel_slack.name) > local.az.bot_channel_slack.min_length
    }
    bot_channels_registration = {
      valid_name = length(regexall(local.az.bot_channels_registration.regex, local.az.bot_channels_registration.name)) > 0 && length(local.az.bot_channels_registration.name) > local.az.bot_channels_registration.min_length
    }
    bot_connection = {
      valid_name = length(regexall(local.az.bot_connection.regex, local.az.bot_connection.name)) > 0 && length(local.az.bot_connection.name) > local.az.bot_connection.min_length
    }
    bot_web_app = {
      valid_name = length(regexall(local.az.bot_web_app.regex, local.az.bot_web_app.name)) > 0 && length(local.az.bot_web_app.name) > local.az.bot_web_app.min_length
    }
    cdn_endpoint = {
      valid_name = length(regexall(local.az.cdn_endpoint.regex, local.az.cdn_endpoint.name)) > 0 && length(local.az.cdn_endpoint.name) > local.az.cdn_endpoint.min_length
    }
    cdn_profile = {
      valid_name = length(regexall(local.az.cdn_profile.regex, local.az.cdn_profile.name)) > 0 && length(local.az.cdn_profile.name) > local.az.cdn_profile.min_length
    }
    cognitive_account = {
      valid_name = length(regexall(local.az.cognitive_account.regex, local.az.cognitive_account.name)) > 0 && length(local.az.cognitive_account.name) > local.az.cognitive_account.min_length
    }
    container_group = {
      valid_name = length(regexall(local.az.container_group.regex, local.az.container_group.name)) > 0 && length(local.az.container_group.name) > local.az.container_group.min_length
    }
    container_registry = {
      valid_name = length(regexall(local.az.container_registry.regex, local.az.container_registry.name)) > 0 && length(local.az.container_registry.name) > local.az.container_registry.min_length
    }
    container_registry_webhook = {
      valid_name = length(regexall(local.az.container_registry_webhook.regex, local.az.container_registry_webhook.name)) > 0 && length(local.az.container_registry_webhook.name) > local.az.container_registry_webhook.min_length
    }
    cosmosdb_account = {
      valid_name = length(regexall(local.az.cosmosdb_account.regex, local.az.cosmosdb_account.name)) > 0 && length(local.az.cosmosdb_account.name) > local.az.cosmosdb_account.min_length
    }
    cosmosdb_postgres = {
      valid_name = length(regexall(local.az.cosmosdb_postgres.regex, local.az.cosmosdb_postgres.name)) > 0 && length(local.az.cosmosdb_postgres.name) > local.az.cosmosdb_postgres.min_length
    }
    custom_provider = {
      valid_name = length(regexall(local.az.custom_provider.regex, local.az.custom_provider.name)) > 0 && length(local.az.custom_provider.name) > local.az.custom_provider.min_length
    }
    dashboard = {
      valid_name = length(regexall(local.az.dashboard.regex, local.az.dashboard.name)) > 0 && length(local.az.dashboard.name) > local.az.dashboard.min_length
    }
    data_factory = {
      valid_name = length(regexall(local.az.data_factory.regex, local.az.data_factory.name)) > 0 && length(local.az.data_factory.name) > local.az.data_factory.min_length
    }
    data_factory_dataset_mysql = {
      valid_name = length(regexall(local.az.data_factory_dataset_mysql.regex, local.az.data_factory_dataset_mysql.name)) > 0 && length(local.az.data_factory_dataset_mysql.name) > local.az.data_factory_dataset_mysql.min_length
    }
    data_factory_dataset_postgresql = {
      valid_name = length(regexall(local.az.data_factory_dataset_postgresql.regex, local.az.data_factory_dataset_postgresql.name)) > 0 && length(local.az.data_factory_dataset_postgresql.name) > local.az.data_factory_dataset_postgresql.min_length
    }
    data_factory_dataset_sql_server_table = {
      valid_name = length(regexall(local.az.data_factory_dataset_sql_server_table.regex, local.az.data_factory_dataset_sql_server_table.name)) > 0 && length(local.az.data_factory_dataset_sql_server_table.name) > local.az.data_factory_dataset_sql_server_table.min_length
    }
    data_factory_integration_runtime_managed = {
      valid_name = length(regexall(local.az.data_factory_integration_runtime_managed.regex, local.az.data_factory_integration_runtime_managed.name)) > 0 && length(local.az.data_factory_integration_runtime_managed.name) > local.az.data_factory_integration_runtime_managed.min_length
    }
    data_factory_linked_service_data_lake_storage_gen2 = {
      valid_name = length(regexall(local.az.data_factory_linked_service_data_lake_storage_gen2.regex, local.az.data_factory_linked_service_data_lake_storage_gen2.name)) > 0 && length(local.az.data_factory_linked_service_data_lake_storage_gen2.name) > local.az.data_factory_linked_service_data_lake_storage_gen2.min_length
    }
    data_factory_linked_service_key_vault = {
      valid_name = length(regexall(local.az.data_factory_linked_service_key_vault.regex, local.az.data_factory_linked_service_key_vault.name)) > 0 && length(local.az.data_factory_linked_service_key_vault.name) > local.az.data_factory_linked_service_key_vault.min_length
    }
    data_factory_linked_service_mysql = {
      valid_name = length(regexall(local.az.data_factory_linked_service_mysql.regex, local.az.data_factory_linked_service_mysql.name)) > 0 && length(local.az.data_factory_linked_service_mysql.name) > local.az.data_factory_linked_service_mysql.min_length
    }
    data_factory_linked_service_postgresql = {
      valid_name = length(regexall(local.az.data_factory_linked_service_postgresql.regex, local.az.data_factory_linked_service_postgresql.name)) > 0 && length(local.az.data_factory_linked_service_postgresql.name) > local.az.data_factory_linked_service_postgresql.min_length
    }
    data_factory_linked_service_sql_server = {
      valid_name = length(regexall(local.az.data_factory_linked_service_sql_server.regex, local.az.data_factory_linked_service_sql_server.name)) > 0 && length(local.az.data_factory_linked_service_sql_server.name) > local.az.data_factory_linked_service_sql_server.min_length
    }
    data_factory_pipeline = {
      valid_name = length(regexall(local.az.data_factory_pipeline.regex, local.az.data_factory_pipeline.name)) > 0 && length(local.az.data_factory_pipeline.name) > local.az.data_factory_pipeline.min_length
    }
    data_factory_trigger_schedule = {
      valid_name = length(regexall(local.az.data_factory_trigger_schedule.regex, local.az.data_factory_trigger_schedule.name)) > 0 && length(local.az.data_factory_trigger_schedule.name) > local.az.data_factory_trigger_schedule.min_length
    }
    data_lake_analytics_account = {
      valid_name = length(regexall(local.az.data_lake_analytics_account.regex, local.az.data_lake_analytics_account.name)) > 0 && length(local.az.data_lake_analytics_account.name) > local.az.data_lake_analytics_account.min_length
    }
    data_lake_analytics_firewall_rule = {
      valid_name = length(regexall(local.az.data_lake_analytics_firewall_rule.regex, local.az.data_lake_analytics_firewall_rule.name)) > 0 && length(local.az.data_lake_analytics_firewall_rule.name) > local.az.data_lake_analytics_firewall_rule.min_length
    }
    data_lake_store = {
      valid_name = length(regexall(local.az.data_lake_store.regex, local.az.data_lake_store.name)) > 0 && length(local.az.data_lake_store.name) > local.az.data_lake_store.min_length
    }
    data_lake_store_firewall_rule = {
      valid_name = length(regexall(local.az.data_lake_store_firewall_rule.regex, local.az.data_lake_store_firewall_rule.name)) > 0 && length(local.az.data_lake_store_firewall_rule.name) > local.az.data_lake_store_firewall_rule.min_length
    }
    database_migration_project = {
      valid_name = length(regexall(local.az.database_migration_project.regex, local.az.database_migration_project.name)) > 0 && length(local.az.database_migration_project.name) > local.az.database_migration_project.min_length
    }
    database_migration_service = {
      valid_name = length(regexall(local.az.database_migration_service.regex, local.az.database_migration_service.name)) > 0 && length(local.az.database_migration_service.name) > local.az.database_migration_service.min_length
    }
    databricks_cluster = {
      valid_name = length(regexall(local.az.databricks_cluster.regex, local.az.databricks_cluster.name)) > 0 && length(local.az.databricks_cluster.name) > local.az.databricks_cluster.min_length
    }
    databricks_high_concurrency_cluster = {
      valid_name = length(regexall(local.az.databricks_high_concurrency_cluster.regex, local.az.databricks_high_concurrency_cluster.name)) > 0 && length(local.az.databricks_high_concurrency_cluster.name) > local.az.databricks_high_concurrency_cluster.min_length
    }
    databricks_standard_cluster = {
      valid_name = length(regexall(local.az.databricks_standard_cluster.regex, local.az.databricks_standard_cluster.name)) > 0 && length(local.az.databricks_standard_cluster.name) > local.az.databricks_standard_cluster.min_length
    }
    databricks_workspace = {
      valid_name = length(regexall(local.az.databricks_workspace.regex, local.az.databricks_workspace.name)) > 0 && length(local.az.databricks_workspace.name) > local.az.databricks_workspace.min_length
    }
    dev_test_lab = {
      valid_name = length(regexall(local.az.dev_test_lab.regex, local.az.dev_test_lab.name)) > 0 && length(local.az.dev_test_lab.name) > local.az.dev_test_lab.min_length
    }
    dev_test_linux_virtual_machine = {
      valid_name = length(regexall(local.az.dev_test_linux_virtual_machine.regex, local.az.dev_test_linux_virtual_machine.name)) > 0 && length(local.az.dev_test_linux_virtual_machine.name) > local.az.dev_test_linux_virtual_machine.min_length
    }
    dev_test_windows_virtual_machine = {
      valid_name = length(regexall(local.az.dev_test_windows_virtual_machine.regex, local.az.dev_test_windows_virtual_machine.name)) > 0 && length(local.az.dev_test_windows_virtual_machine.name) > local.az.dev_test_windows_virtual_machine.min_length
    }
    disk_encryption_set = {
      valid_name = length(regexall(local.az.disk_encryption_set.regex, local.az.disk_encryption_set.name)) > 0 && length(local.az.disk_encryption_set.name) > local.az.disk_encryption_set.min_length
    }
    dns_a_record = {
      valid_name = length(regexall(local.az.dns_a_record.regex, local.az.dns_a_record.name)) > 0 && length(local.az.dns_a_record.name) > local.az.dns_a_record.min_length
    }
    dns_aaaa_record = {
      valid_name = length(regexall(local.az.dns_aaaa_record.regex, local.az.dns_aaaa_record.name)) > 0 && length(local.az.dns_aaaa_record.name) > local.az.dns_aaaa_record.min_length
    }
    dns_caa_record = {
      valid_name = length(regexall(local.az.dns_caa_record.regex, local.az.dns_caa_record.name)) > 0 && length(local.az.dns_caa_record.name) > local.az.dns_caa_record.min_length
    }
    dns_cname_record = {
      valid_name = length(regexall(local.az.dns_cname_record.regex, local.az.dns_cname_record.name)) > 0 && length(local.az.dns_cname_record.name) > local.az.dns_cname_record.min_length
    }
    dns_mx_record = {
      valid_name = length(regexall(local.az.dns_mx_record.regex, local.az.dns_mx_record.name)) > 0 && length(local.az.dns_mx_record.name) > local.az.dns_mx_record.min_length
    }
    dns_ns_record = {
      valid_name = length(regexall(local.az.dns_ns_record.regex, local.az.dns_ns_record.name)) > 0 && length(local.az.dns_ns_record.name) > local.az.dns_ns_record.min_length
    }
    dns_ptr_record = {
      valid_name = length(regexall(local.az.dns_ptr_record.regex, local.az.dns_ptr_record.name)) > 0 && length(local.az.dns_ptr_record.name) > local.az.dns_ptr_record.min_length
    }
    dns_txt_record = {
      valid_name = length(regexall(local.az.dns_txt_record.regex, local.az.dns_txt_record.name)) > 0 && length(local.az.dns_txt_record.name) > local.az.dns_txt_record.min_length
    }
    dns_zone = {
      valid_name = length(regexall(local.az.dns_zone.regex, local.az.dns_zone.name)) > 0 && length(local.az.dns_zone.name) > local.az.dns_zone.min_length
    }
    eventgrid_domain = {
      valid_name = length(regexall(local.az.eventgrid_domain.regex, local.az.eventgrid_domain.name)) > 0 && length(local.az.eventgrid_domain.name) > local.az.eventgrid_domain.min_length
    }
    eventgrid_domain_topic = {
      valid_name = length(regexall(local.az.eventgrid_domain_topic.regex, local.az.eventgrid_domain_topic.name)) > 0 && length(local.az.eventgrid_domain_topic.name) > local.az.eventgrid_domain_topic.min_length
    }
    eventgrid_event_subscription = {
      valid_name = length(regexall(local.az.eventgrid_event_subscription.regex, local.az.eventgrid_event_subscription.name)) > 0 && length(local.az.eventgrid_event_subscription.name) > local.az.eventgrid_event_subscription.min_length
    }
    eventgrid_topic = {
      valid_name = length(regexall(local.az.eventgrid_topic.regex, local.az.eventgrid_topic.name)) > 0 && length(local.az.eventgrid_topic.name) > local.az.eventgrid_topic.min_length
    }
    eventhub = {
      valid_name = length(regexall(local.az.eventhub.regex, local.az.eventhub.name)) > 0 && length(local.az.eventhub.name) > local.az.eventhub.min_length
    }
    eventhub_authorization_rule = {
      valid_name = length(regexall(local.az.eventhub_authorization_rule.regex, local.az.eventhub_authorization_rule.name)) > 0 && length(local.az.eventhub_authorization_rule.name) > local.az.eventhub_authorization_rule.min_length
    }
    eventhub_consumer_group = {
      valid_name = length(regexall(local.az.eventhub_consumer_group.regex, local.az.eventhub_consumer_group.name)) > 0 && length(local.az.eventhub_consumer_group.name) > local.az.eventhub_consumer_group.min_length
    }
    eventhub_namespace = {
      valid_name = length(regexall(local.az.eventhub_namespace.regex, local.az.eventhub_namespace.name)) > 0 && length(local.az.eventhub_namespace.name) > local.az.eventhub_namespace.min_length
    }
    eventhub_namespace_authorization_rule = {
      valid_name = length(regexall(local.az.eventhub_namespace_authorization_rule.regex, local.az.eventhub_namespace_authorization_rule.name)) > 0 && length(local.az.eventhub_namespace_authorization_rule.name) > local.az.eventhub_namespace_authorization_rule.min_length
    }
    eventhub_namespace_disaster_recovery_config = {
      valid_name = length(regexall(local.az.eventhub_namespace_disaster_recovery_config.regex, local.az.eventhub_namespace_disaster_recovery_config.name)) > 0 && length(local.az.eventhub_namespace_disaster_recovery_config.name) > local.az.eventhub_namespace_disaster_recovery_config.min_length
    }
    express_route_circuit = {
      valid_name = length(regexall(local.az.express_route_circuit.regex, local.az.express_route_circuit.name)) > 0 && length(local.az.express_route_circuit.name) > local.az.express_route_circuit.min_length
    }
    express_route_gateway = {
      valid_name = length(regexall(local.az.express_route_gateway.regex, local.az.express_route_gateway.name)) > 0 && length(local.az.express_route_gateway.name) > local.az.express_route_gateway.min_length
    }
    firewall = {
      valid_name = length(regexall(local.az.firewall.regex, local.az.firewall.name)) > 0 && length(local.az.firewall.name) > local.az.firewall.min_length
    }
    firewall_application_rule_collection = {
      valid_name = length(regexall(local.az.firewall_application_rule_collection.regex, local.az.firewall_application_rule_collection.name)) > 0 && length(local.az.firewall_application_rule_collection.name) > local.az.firewall_application_rule_collection.min_length
    }
    firewall_ip_configuration = {
      valid_name = length(regexall(local.az.firewall_ip_configuration.regex, local.az.firewall_ip_configuration.name)) > 0 && length(local.az.firewall_ip_configuration.name) > local.az.firewall_ip_configuration.min_length
    }
    firewall_nat_rule_collection = {
      valid_name = length(regexall(local.az.firewall_nat_rule_collection.regex, local.az.firewall_nat_rule_collection.name)) > 0 && length(local.az.firewall_nat_rule_collection.name) > local.az.firewall_nat_rule_collection.min_length
    }
    firewall_network_rule_collection = {
      valid_name = length(regexall(local.az.firewall_network_rule_collection.regex, local.az.firewall_network_rule_collection.name)) > 0 && length(local.az.firewall_network_rule_collection.name) > local.az.firewall_network_rule_collection.min_length
    }
    firewall_policy = {
      valid_name = length(regexall(local.az.firewall_policy.regex, local.az.firewall_policy.name)) > 0 && length(local.az.firewall_policy.name) > local.az.firewall_policy.min_length
    }
    frontdoor = {
      valid_name = length(regexall(local.az.frontdoor.regex, local.az.frontdoor.name)) > 0 && length(local.az.frontdoor.name) > local.az.frontdoor.min_length
    }
    frontdoor_firewall_policy = {
      valid_name = length(regexall(local.az.frontdoor_firewall_policy.regex, local.az.frontdoor_firewall_policy.name)) > 0 && length(local.az.frontdoor_firewall_policy.name) > local.az.frontdoor_firewall_policy.min_length
    }
    function_app = {
      valid_name = length(regexall(local.az.function_app.regex, local.az.function_app.name)) > 0 && length(local.az.function_app.name) > local.az.function_app.min_length
    }
    hdinsight_hadoop_cluster = {
      valid_name = length(regexall(local.az.hdinsight_hadoop_cluster.regex, local.az.hdinsight_hadoop_cluster.name)) > 0 && length(local.az.hdinsight_hadoop_cluster.name) > local.az.hdinsight_hadoop_cluster.min_length
    }
    hdinsight_hbase_cluster = {
      valid_name = length(regexall(local.az.hdinsight_hbase_cluster.regex, local.az.hdinsight_hbase_cluster.name)) > 0 && length(local.az.hdinsight_hbase_cluster.name) > local.az.hdinsight_hbase_cluster.min_length
    }
    hdinsight_interactive_query_cluster = {
      valid_name = length(regexall(local.az.hdinsight_interactive_query_cluster.regex, local.az.hdinsight_interactive_query_cluster.name)) > 0 && length(local.az.hdinsight_interactive_query_cluster.name) > local.az.hdinsight_interactive_query_cluster.min_length
    }
    hdinsight_kafka_cluster = {
      valid_name = length(regexall(local.az.hdinsight_kafka_cluster.regex, local.az.hdinsight_kafka_cluster.name)) > 0 && length(local.az.hdinsight_kafka_cluster.name) > local.az.hdinsight_kafka_cluster.min_length
    }
    hdinsight_ml_services_cluster = {
      valid_name = length(regexall(local.az.hdinsight_ml_services_cluster.regex, local.az.hdinsight_ml_services_cluster.name)) > 0 && length(local.az.hdinsight_ml_services_cluster.name) > local.az.hdinsight_ml_services_cluster.min_length
    }
    hdinsight_rserver_cluster = {
      valid_name = length(regexall(local.az.hdinsight_rserver_cluster.regex, local.az.hdinsight_rserver_cluster.name)) > 0 && length(local.az.hdinsight_rserver_cluster.name) > local.az.hdinsight_rserver_cluster.min_length
    }
    hdinsight_spark_cluster = {
      valid_name = length(regexall(local.az.hdinsight_spark_cluster.regex, local.az.hdinsight_spark_cluster.name)) > 0 && length(local.az.hdinsight_spark_cluster.name) > local.az.hdinsight_spark_cluster.min_length
    }
    hdinsight_storm_cluster = {
      valid_name = length(regexall(local.az.hdinsight_storm_cluster.regex, local.az.hdinsight_storm_cluster.name)) > 0 && length(local.az.hdinsight_storm_cluster.name) > local.az.hdinsight_storm_cluster.min_length
    }
    image = {
      valid_name = length(regexall(local.az.image.regex, local.az.image.name)) > 0 && length(local.az.image.name) > local.az.image.min_length
    }
    iotcentral_application = {
      valid_name = length(regexall(local.az.iotcentral_application.regex, local.az.iotcentral_application.name)) > 0 && length(local.az.iotcentral_application.name) > local.az.iotcentral_application.min_length
    }
    iothub = {
      valid_name = length(regexall(local.az.iothub.regex, local.az.iothub.name)) > 0 && length(local.az.iothub.name) > local.az.iothub.min_length
    }
    iothub_consumer_group = {
      valid_name = length(regexall(local.az.iothub_consumer_group.regex, local.az.iothub_consumer_group.name)) > 0 && length(local.az.iothub_consumer_group.name) > local.az.iothub_consumer_group.min_length
    }
    iothub_dps = {
      valid_name = length(regexall(local.az.iothub_dps.regex, local.az.iothub_dps.name)) > 0 && length(local.az.iothub_dps.name) > local.az.iothub_dps.min_length
    }
    iothub_dps_certificate = {
      valid_name = length(regexall(local.az.iothub_dps_certificate.regex, local.az.iothub_dps_certificate.name)) > 0 && length(local.az.iothub_dps_certificate.name) > local.az.iothub_dps_certificate.min_length
    }
    key_vault = {
      valid_name = length(regexall(local.az.key_vault.regex, local.az.key_vault.name)) > 0 && length(local.az.key_vault.name) > local.az.key_vault.min_length
    }
    key_vault_certificate = {
      valid_name = length(regexall(local.az.key_vault_certificate.regex, local.az.key_vault_certificate.name)) > 0 && length(local.az.key_vault_certificate.name) > local.az.key_vault_certificate.min_length
    }
    key_vault_key = {
      valid_name = length(regexall(local.az.key_vault_key.regex, local.az.key_vault_key.name)) > 0 && length(local.az.key_vault_key.name) > local.az.key_vault_key.min_length
    }
    key_vault_secret = {
      valid_name = length(regexall(local.az.key_vault_secret.regex, local.az.key_vault_secret.name)) > 0 && length(local.az.key_vault_secret.name) > local.az.key_vault_secret.min_length
    }
    kubernetes_cluster = {
      valid_name = length(regexall(local.az.kubernetes_cluster.regex, local.az.kubernetes_cluster.name)) > 0 && length(local.az.kubernetes_cluster.name) > local.az.kubernetes_cluster.min_length
    }
    kusto_cluster = {
      valid_name = length(regexall(local.az.kusto_cluster.regex, local.az.kusto_cluster.name)) > 0 && length(local.az.kusto_cluster.name) > local.az.kusto_cluster.min_length
    }
    kusto_database = {
      valid_name = length(regexall(local.az.kusto_database.regex, local.az.kusto_database.name)) > 0 && length(local.az.kusto_database.name) > local.az.kusto_database.min_length
    }
    kusto_eventhub_data_connection = {
      valid_name = length(regexall(local.az.kusto_eventhub_data_connection.regex, local.az.kusto_eventhub_data_connection.name)) > 0 && length(local.az.kusto_eventhub_data_connection.name) > local.az.kusto_eventhub_data_connection.min_length
    }
    lb = {
      valid_name = length(regexall(local.az.lb.regex, local.az.lb.name)) > 0 && length(local.az.lb.name) > local.az.lb.min_length
    }
    lb_nat_rule = {
      valid_name = length(regexall(local.az.lb_nat_rule.regex, local.az.lb_nat_rule.name)) > 0 && length(local.az.lb_nat_rule.name) > local.az.lb_nat_rule.min_length
    }
    linux_virtual_machine = {
      valid_name = length(regexall(local.az.linux_virtual_machine.regex, local.az.linux_virtual_machine.name)) > 0 && length(local.az.linux_virtual_machine.name) > local.az.linux_virtual_machine.min_length
    }
    linux_virtual_machine_scale_set = {
      valid_name = length(regexall(local.az.linux_virtual_machine_scale_set.regex, local.az.linux_virtual_machine_scale_set.name)) > 0 && length(local.az.linux_virtual_machine_scale_set.name) > local.az.linux_virtual_machine_scale_set.min_length
    }
    load_testing_resource = {
      valid_name = length(regexall(local.az.load_testing_resource.regex, local.az.load_testing_resource.name)) > 0 && length(local.az.load_testing_resource.name) > local.az.load_testing_resource.min_length
    }
    local_network_gateway = {
      valid_name = length(regexall(local.az.local_network_gateway.regex, local.az.local_network_gateway.name)) > 0 && length(local.az.local_network_gateway.name) > local.az.local_network_gateway.min_length
    }
    log_analytics_workspace = {
      valid_name = length(regexall(local.az.log_analytics_workspace.regex, local.az.log_analytics_workspace.name)) > 0 && length(local.az.log_analytics_workspace.name) > local.az.log_analytics_workspace.min_length
    }
    logic_app_workflow = {
      valid_name = length(regexall(local.az.logic_app_workflow.regex, local.az.logic_app_workflow.name)) > 0 && length(local.az.logic_app_workflow.name) > local.az.logic_app_workflow.min_length
    }
    machine_learning_workspace = {
      valid_name = length(regexall(local.az.machine_learning_workspace.regex, local.az.machine_learning_workspace.name)) > 0 && length(local.az.machine_learning_workspace.name) > local.az.machine_learning_workspace.min_length
    }
    managed_disk = {
      valid_name = length(regexall(local.az.managed_disk.regex, local.az.managed_disk.name)) > 0 && length(local.az.managed_disk.name) > local.az.managed_disk.min_length
    }
    maps_account = {
      valid_name = length(regexall(local.az.maps_account.regex, local.az.maps_account.name)) > 0 && length(local.az.maps_account.name) > local.az.maps_account.min_length
    }
    mariadb_database = {
      valid_name = length(regexall(local.az.mariadb_database.regex, local.az.mariadb_database.name)) > 0 && length(local.az.mariadb_database.name) > local.az.mariadb_database.min_length
    }
    mariadb_firewall_rule = {
      valid_name = length(regexall(local.az.mariadb_firewall_rule.regex, local.az.mariadb_firewall_rule.name)) > 0 && length(local.az.mariadb_firewall_rule.name) > local.az.mariadb_firewall_rule.min_length
    }
    mariadb_server = {
      valid_name = length(regexall(local.az.mariadb_server.regex, local.az.mariadb_server.name)) > 0 && length(local.az.mariadb_server.name) > local.az.mariadb_server.min_length
    }
    mariadb_virtual_network_rule = {
      valid_name = length(regexall(local.az.mariadb_virtual_network_rule.regex, local.az.mariadb_virtual_network_rule.name)) > 0 && length(local.az.mariadb_virtual_network_rule.name) > local.az.mariadb_virtual_network_rule.min_length
    }
    monitor_action_group = {
      valid_name = length(regexall(local.az.monitor_action_group.regex, local.az.monitor_action_group.name)) > 0 && length(local.az.monitor_action_group.name) > local.az.monitor_action_group.min_length
    }
    monitor_autoscale_setting = {
      valid_name = length(regexall(local.az.monitor_autoscale_setting.regex, local.az.monitor_autoscale_setting.name)) > 0 && length(local.az.monitor_autoscale_setting.name) > local.az.monitor_autoscale_setting.min_length
    }
    monitor_diagnostic_setting = {
      valid_name = length(regexall(local.az.monitor_diagnostic_setting.regex, local.az.monitor_diagnostic_setting.name)) > 0 && length(local.az.monitor_diagnostic_setting.name) > local.az.monitor_diagnostic_setting.min_length
    }
    monitor_scheduled_query_rules_alert = {
      valid_name = length(regexall(local.az.monitor_scheduled_query_rules_alert.regex, local.az.monitor_scheduled_query_rules_alert.name)) > 0 && length(local.az.monitor_scheduled_query_rules_alert.name) > local.az.monitor_scheduled_query_rules_alert.min_length
    }
    mssql_database = {
      valid_name = length(regexall(local.az.mssql_database.regex, local.az.mssql_database.name)) > 0 && length(local.az.mssql_database.name) > local.az.mssql_database.min_length
    }
    mssql_elasticpool = {
      valid_name = length(regexall(local.az.mssql_elasticpool.regex, local.az.mssql_elasticpool.name)) > 0 && length(local.az.mssql_elasticpool.name) > local.az.mssql_elasticpool.min_length
    }
    mssql_server = {
      valid_name = length(regexall(local.az.mssql_server.regex, local.az.mssql_server.name)) > 0 && length(local.az.mssql_server.name) > local.az.mssql_server.min_length
    }
    mysql_database = {
      valid_name = length(regexall(local.az.mysql_database.regex, local.az.mysql_database.name)) > 0 && length(local.az.mysql_database.name) > local.az.mysql_database.min_length
    }
    mysql_firewall_rule = {
      valid_name = length(regexall(local.az.mysql_firewall_rule.regex, local.az.mysql_firewall_rule.name)) > 0 && length(local.az.mysql_firewall_rule.name) > local.az.mysql_firewall_rule.min_length
    }
    mysql_server = {
      valid_name = length(regexall(local.az.mysql_server.regex, local.az.mysql_server.name)) > 0 && length(local.az.mysql_server.name) > local.az.mysql_server.min_length
    }
    mysql_virtual_network_rule = {
      valid_name = length(regexall(local.az.mysql_virtual_network_rule.regex, local.az.mysql_virtual_network_rule.name)) > 0 && length(local.az.mysql_virtual_network_rule.name) > local.az.mysql_virtual_network_rule.min_length
    }
    network_ddos_protection_plan = {
      valid_name = length(regexall(local.az.network_ddos_protection_plan.regex, local.az.network_ddos_protection_plan.name)) > 0 && length(local.az.network_ddos_protection_plan.name) > local.az.network_ddos_protection_plan.min_length
    }
    network_interface = {
      valid_name = length(regexall(local.az.network_interface.regex, local.az.network_interface.name)) > 0 && length(local.az.network_interface.name) > local.az.network_interface.min_length
    }
    network_security_group = {
      valid_name = length(regexall(local.az.network_security_group.regex, local.az.network_security_group.name)) > 0 && length(local.az.network_security_group.name) > local.az.network_security_group.min_length
    }
    network_security_group_rule = {
      valid_name = length(regexall(local.az.network_security_group_rule.regex, local.az.network_security_group_rule.name)) > 0 && length(local.az.network_security_group_rule.name) > local.az.network_security_group_rule.min_length
    }
    network_security_rule = {
      valid_name = length(regexall(local.az.network_security_rule.regex, local.az.network_security_rule.name)) > 0 && length(local.az.network_security_rule.name) > local.az.network_security_rule.min_length
    }
    network_watcher = {
      valid_name = length(regexall(local.az.network_watcher.regex, local.az.network_watcher.name)) > 0 && length(local.az.network_watcher.name) > local.az.network_watcher.min_length
    }
    notification_hub = {
      valid_name = length(regexall(local.az.notification_hub.regex, local.az.notification_hub.name)) > 0 && length(local.az.notification_hub.name) > local.az.notification_hub.min_length
    }
    notification_hub_authorization_rule = {
      valid_name = length(regexall(local.az.notification_hub_authorization_rule.regex, local.az.notification_hub_authorization_rule.name)) > 0 && length(local.az.notification_hub_authorization_rule.name) > local.az.notification_hub_authorization_rule.min_length
    }
    notification_hub_namespace = {
      valid_name = length(regexall(local.az.notification_hub_namespace.regex, local.az.notification_hub_namespace.name)) > 0 && length(local.az.notification_hub_namespace.name) > local.az.notification_hub_namespace.min_length
    }
    point_to_site_vpn_gateway = {
      valid_name = length(regexall(local.az.point_to_site_vpn_gateway.regex, local.az.point_to_site_vpn_gateway.name)) > 0 && length(local.az.point_to_site_vpn_gateway.name) > local.az.point_to_site_vpn_gateway.min_length
    }
    postgresql_database = {
      valid_name = length(regexall(local.az.postgresql_database.regex, local.az.postgresql_database.name)) > 0 && length(local.az.postgresql_database.name) > local.az.postgresql_database.min_length
    }
    postgresql_firewall_rule = {
      valid_name = length(regexall(local.az.postgresql_firewall_rule.regex, local.az.postgresql_firewall_rule.name)) > 0 && length(local.az.postgresql_firewall_rule.name) > local.az.postgresql_firewall_rule.min_length
    }
    postgresql_server = {
      valid_name = length(regexall(local.az.postgresql_server.regex, local.az.postgresql_server.name)) > 0 && length(local.az.postgresql_server.name) > local.az.postgresql_server.min_length
    }
    postgresql_virtual_network_rule = {
      valid_name = length(regexall(local.az.postgresql_virtual_network_rule.regex, local.az.postgresql_virtual_network_rule.name)) > 0 && length(local.az.postgresql_virtual_network_rule.name) > local.az.postgresql_virtual_network_rule.min_length
    }
    powerbi_embedded = {
      valid_name = length(regexall(local.az.powerbi_embedded.regex, local.az.powerbi_embedded.name)) > 0 && length(local.az.powerbi_embedded.name) > local.az.powerbi_embedded.min_length
    }
    private_dns_a_record = {
      valid_name = length(regexall(local.az.private_dns_a_record.regex, local.az.private_dns_a_record.name)) > 0 && length(local.az.private_dns_a_record.name) > local.az.private_dns_a_record.min_length
    }
    private_dns_aaaa_record = {
      valid_name = length(regexall(local.az.private_dns_aaaa_record.regex, local.az.private_dns_aaaa_record.name)) > 0 && length(local.az.private_dns_aaaa_record.name) > local.az.private_dns_aaaa_record.min_length
    }
    private_dns_cname_record = {
      valid_name = length(regexall(local.az.private_dns_cname_record.regex, local.az.private_dns_cname_record.name)) > 0 && length(local.az.private_dns_cname_record.name) > local.az.private_dns_cname_record.min_length
    }
    private_dns_mx_record = {
      valid_name = length(regexall(local.az.private_dns_mx_record.regex, local.az.private_dns_mx_record.name)) > 0 && length(local.az.private_dns_mx_record.name) > local.az.private_dns_mx_record.min_length
    }
    private_dns_ptr_record = {
      valid_name = length(regexall(local.az.private_dns_ptr_record.regex, local.az.private_dns_ptr_record.name)) > 0 && length(local.az.private_dns_ptr_record.name) > local.az.private_dns_ptr_record.min_length
    }
    private_dns_srv_record = {
      valid_name = length(regexall(local.az.private_dns_srv_record.regex, local.az.private_dns_srv_record.name)) > 0 && length(local.az.private_dns_srv_record.name) > local.az.private_dns_srv_record.min_length
    }
    private_dns_txt_record = {
      valid_name = length(regexall(local.az.private_dns_txt_record.regex, local.az.private_dns_txt_record.name)) > 0 && length(local.az.private_dns_txt_record.name) > local.az.private_dns_txt_record.min_length
    }
    private_dns_zone = {
      valid_name = length(regexall(local.az.private_dns_zone.regex, local.az.private_dns_zone.name)) > 0 && length(local.az.private_dns_zone.name) > local.az.private_dns_zone.min_length
    }
    private_dns_zone_group = {
      valid_name = length(regexall(local.az.private_dns_zone_group.regex, local.az.private_dns_zone_group.name)) > 0 && length(local.az.private_dns_zone_group.name) > local.az.private_dns_zone_group.min_length
    }
    private_endpoint = {
      valid_name = length(regexall(local.az.private_endpoint.regex, local.az.private_endpoint.name)) > 0 && length(local.az.private_endpoint.name) > local.az.private_endpoint.min_length
    }
    private_link_service = {
      valid_name = length(regexall(local.az.private_link_service.regex, local.az.private_link_service.name)) > 0 && length(local.az.private_link_service.name) > local.az.private_link_service.min_length
    }
    private_service_connection = {
      valid_name = length(regexall(local.az.private_service_connection.regex, local.az.private_service_connection.name)) > 0 && length(local.az.private_service_connection.name) > local.az.private_service_connection.min_length
    }
    proximity_placement_group = {
      valid_name = length(regexall(local.az.proximity_placement_group.regex, local.az.proximity_placement_group.name)) > 0 && length(local.az.proximity_placement_group.name) > local.az.proximity_placement_group.min_length
    }
    public_ip = {
      valid_name = length(regexall(local.az.public_ip.regex, local.az.public_ip.name)) > 0 && length(local.az.public_ip.name) > local.az.public_ip.min_length
    }
    public_ip_prefix = {
      valid_name = length(regexall(local.az.public_ip_prefix.regex, local.az.public_ip_prefix.name)) > 0 && length(local.az.public_ip_prefix.name) > local.az.public_ip_prefix.min_length
    }
    recovery_services_vault = {
      valid_name = length(regexall(local.az.recovery_services_vault.regex, local.az.recovery_services_vault.name)) > 0 && length(local.az.recovery_services_vault.name) > local.az.recovery_services_vault.min_length
    }
    redis_cache = {
      valid_name = length(regexall(local.az.redis_cache.regex, local.az.redis_cache.name)) > 0 && length(local.az.redis_cache.name) > local.az.redis_cache.min_length
    }
    redis_firewall_rule = {
      valid_name = length(regexall(local.az.redis_firewall_rule.regex, local.az.redis_firewall_rule.name)) > 0 && length(local.az.redis_firewall_rule.name) > local.az.redis_firewall_rule.min_length
    }
    relay_hybrid_connection = {
      valid_name = length(regexall(local.az.relay_hybrid_connection.regex, local.az.relay_hybrid_connection.name)) > 0 && length(local.az.relay_hybrid_connection.name) > local.az.relay_hybrid_connection.min_length
    }
    relay_namespace = {
      valid_name = length(regexall(local.az.relay_namespace.regex, local.az.relay_namespace.name)) > 0 && length(local.az.relay_namespace.name) > local.az.relay_namespace.min_length
    }
    resource_group = {
      valid_name = length(regexall(local.az.resource_group.regex, local.az.resource_group.name)) > 0 && length(local.az.resource_group.name) > local.az.resource_group.min_length
    }
    role_assignment = {
      valid_name = length(regexall(local.az.role_assignment.regex, local.az.role_assignment.name)) > 0 && length(local.az.role_assignment.name) > local.az.role_assignment.min_length
    }
    role_definition = {
      valid_name = length(regexall(local.az.role_definition.regex, local.az.role_definition.name)) > 0 && length(local.az.role_definition.name) > local.az.role_definition.min_length
    }
    route = {
      valid_name = length(regexall(local.az.route.regex, local.az.route.name)) > 0 && length(local.az.route.name) > local.az.route.min_length
    }
    route_table = {
      valid_name = length(regexall(local.az.route_table.regex, local.az.route_table.name)) > 0 && length(local.az.route_table.name) > local.az.route_table.min_length
    }
    search_service = {
      valid_name = length(regexall(local.az.search_service.regex, local.az.search_service.name)) > 0 && length(local.az.search_service.name) > local.az.search_service.min_length
    }
    service_fabric_cluster = {
      valid_name = length(regexall(local.az.service_fabric_cluster.regex, local.az.service_fabric_cluster.name)) > 0 && length(local.az.service_fabric_cluster.name) > local.az.service_fabric_cluster.min_length
    }
    servicebus_namespace = {
      valid_name = length(regexall(local.az.servicebus_namespace.regex, local.az.servicebus_namespace.name)) > 0 && length(local.az.servicebus_namespace.name) > local.az.servicebus_namespace.min_length
    }
    servicebus_namespace_authorization_rule = {
      valid_name = length(regexall(local.az.servicebus_namespace_authorization_rule.regex, local.az.servicebus_namespace_authorization_rule.name)) > 0 && length(local.az.servicebus_namespace_authorization_rule.name) > local.az.servicebus_namespace_authorization_rule.min_length
    }
    servicebus_queue = {
      valid_name = length(regexall(local.az.servicebus_queue.regex, local.az.servicebus_queue.name)) > 0 && length(local.az.servicebus_queue.name) > local.az.servicebus_queue.min_length
    }
    servicebus_queue_authorization_rule = {
      valid_name = length(regexall(local.az.servicebus_queue_authorization_rule.regex, local.az.servicebus_queue_authorization_rule.name)) > 0 && length(local.az.servicebus_queue_authorization_rule.name) > local.az.servicebus_queue_authorization_rule.min_length
    }
    servicebus_subscription = {
      valid_name = length(regexall(local.az.servicebus_subscription.regex, local.az.servicebus_subscription.name)) > 0 && length(local.az.servicebus_subscription.name) > local.az.servicebus_subscription.min_length
    }
    servicebus_subscription_rule = {
      valid_name = length(regexall(local.az.servicebus_subscription_rule.regex, local.az.servicebus_subscription_rule.name)) > 0 && length(local.az.servicebus_subscription_rule.name) > local.az.servicebus_subscription_rule.min_length
    }
    servicebus_topic = {
      valid_name = length(regexall(local.az.servicebus_topic.regex, local.az.servicebus_topic.name)) > 0 && length(local.az.servicebus_topic.name) > local.az.servicebus_topic.min_length
    }
    servicebus_topic_authorization_rule = {
      valid_name = length(regexall(local.az.servicebus_topic_authorization_rule.regex, local.az.servicebus_topic_authorization_rule.name)) > 0 && length(local.az.servicebus_topic_authorization_rule.name) > local.az.servicebus_topic_authorization_rule.min_length
    }
    shared_image = {
      valid_name = length(regexall(local.az.shared_image.regex, local.az.shared_image.name)) > 0 && length(local.az.shared_image.name) > local.az.shared_image.min_length
    }
    shared_image_gallery = {
      valid_name = length(regexall(local.az.shared_image_gallery.regex, local.az.shared_image_gallery.name)) > 0 && length(local.az.shared_image_gallery.name) > local.az.shared_image_gallery.min_length
    }
    signalr_service = {
      valid_name = length(regexall(local.az.signalr_service.regex, local.az.signalr_service.name)) > 0 && length(local.az.signalr_service.name) > local.az.signalr_service.min_length
    }
    snapshots = {
      valid_name = length(regexall(local.az.snapshots.regex, local.az.snapshots.name)) > 0 && length(local.az.snapshots.name) > local.az.snapshots.min_length
    }
    sql_elasticpool = {
      valid_name = length(regexall(local.az.sql_elasticpool.regex, local.az.sql_elasticpool.name)) > 0 && length(local.az.sql_elasticpool.name) > local.az.sql_elasticpool.min_length
    }
    sql_failover_group = {
      valid_name = length(regexall(local.az.sql_failover_group.regex, local.az.sql_failover_group.name)) > 0 && length(local.az.sql_failover_group.name) > local.az.sql_failover_group.min_length
    }
    sql_firewall_rule = {
      valid_name = length(regexall(local.az.sql_firewall_rule.regex, local.az.sql_firewall_rule.name)) > 0 && length(local.az.sql_firewall_rule.name) > local.az.sql_firewall_rule.min_length
    }
    sql_server = {
      valid_name = length(regexall(local.az.sql_server.regex, local.az.sql_server.name)) > 0 && length(local.az.sql_server.name) > local.az.sql_server.min_length
    }
    storage_account = {
      valid_name = length(regexall(local.az.storage_account.regex, local.az.storage_account.name)) > 0 && length(local.az.storage_account.name) > local.az.storage_account.min_length
    }
    storage_blob = {
      valid_name = length(regexall(local.az.storage_blob.regex, local.az.storage_blob.name)) > 0 && length(local.az.storage_blob.name) > local.az.storage_blob.min_length
    }
    storage_container = {
      valid_name = length(regexall(local.az.storage_container.regex, local.az.storage_container.name)) > 0 && length(local.az.storage_container.name) > local.az.storage_container.min_length
    }
    storage_data_lake_gen2_filesystem = {
      valid_name = length(regexall(local.az.storage_data_lake_gen2_filesystem.regex, local.az.storage_data_lake_gen2_filesystem.name)) > 0 && length(local.az.storage_data_lake_gen2_filesystem.name) > local.az.storage_data_lake_gen2_filesystem.min_length
    }
    storage_queue = {
      valid_name = length(regexall(local.az.storage_queue.regex, local.az.storage_queue.name)) > 0 && length(local.az.storage_queue.name) > local.az.storage_queue.min_length
    }
    storage_share = {
      valid_name = length(regexall(local.az.storage_share.regex, local.az.storage_share.name)) > 0 && length(local.az.storage_share.name) > local.az.storage_share.min_length
    }
    storage_share_directory = {
      valid_name = length(regexall(local.az.storage_share_directory.regex, local.az.storage_share_directory.name)) > 0 && length(local.az.storage_share_directory.name) > local.az.storage_share_directory.min_length
    }
    storage_table = {
      valid_name = length(regexall(local.az.storage_table.regex, local.az.storage_table.name)) > 0 && length(local.az.storage_table.name) > local.az.storage_table.min_length
    }
    stream_analytics_function_javascript_udf = {
      valid_name = length(regexall(local.az.stream_analytics_function_javascript_udf.regex, local.az.stream_analytics_function_javascript_udf.name)) > 0 && length(local.az.stream_analytics_function_javascript_udf.name) > local.az.stream_analytics_function_javascript_udf.min_length
    }
    stream_analytics_job = {
      valid_name = length(regexall(local.az.stream_analytics_job.regex, local.az.stream_analytics_job.name)) > 0 && length(local.az.stream_analytics_job.name) > local.az.stream_analytics_job.min_length
    }
    stream_analytics_output_blob = {
      valid_name = length(regexall(local.az.stream_analytics_output_blob.regex, local.az.stream_analytics_output_blob.name)) > 0 && length(local.az.stream_analytics_output_blob.name) > local.az.stream_analytics_output_blob.min_length
    }
    stream_analytics_output_eventhub = {
      valid_name = length(regexall(local.az.stream_analytics_output_eventhub.regex, local.az.stream_analytics_output_eventhub.name)) > 0 && length(local.az.stream_analytics_output_eventhub.name) > local.az.stream_analytics_output_eventhub.min_length
    }
    stream_analytics_output_mssql = {
      valid_name = length(regexall(local.az.stream_analytics_output_mssql.regex, local.az.stream_analytics_output_mssql.name)) > 0 && length(local.az.stream_analytics_output_mssql.name) > local.az.stream_analytics_output_mssql.min_length
    }
    stream_analytics_output_servicebus_queue = {
      valid_name = length(regexall(local.az.stream_analytics_output_servicebus_queue.regex, local.az.stream_analytics_output_servicebus_queue.name)) > 0 && length(local.az.stream_analytics_output_servicebus_queue.name) > local.az.stream_analytics_output_servicebus_queue.min_length
    }
    stream_analytics_output_servicebus_topic = {
      valid_name = length(regexall(local.az.stream_analytics_output_servicebus_topic.regex, local.az.stream_analytics_output_servicebus_topic.name)) > 0 && length(local.az.stream_analytics_output_servicebus_topic.name) > local.az.stream_analytics_output_servicebus_topic.min_length
    }
    stream_analytics_reference_input_blob = {
      valid_name = length(regexall(local.az.stream_analytics_reference_input_blob.regex, local.az.stream_analytics_reference_input_blob.name)) > 0 && length(local.az.stream_analytics_reference_input_blob.name) > local.az.stream_analytics_reference_input_blob.min_length
    }
    stream_analytics_stream_input_blob = {
      valid_name = length(regexall(local.az.stream_analytics_stream_input_blob.regex, local.az.stream_analytics_stream_input_blob.name)) > 0 && length(local.az.stream_analytics_stream_input_blob.name) > local.az.stream_analytics_stream_input_blob.min_length
    }
    stream_analytics_stream_input_eventhub = {
      valid_name = length(regexall(local.az.stream_analytics_stream_input_eventhub.regex, local.az.stream_analytics_stream_input_eventhub.name)) > 0 && length(local.az.stream_analytics_stream_input_eventhub.name) > local.az.stream_analytics_stream_input_eventhub.min_length
    }
    stream_analytics_stream_input_iothub = {
      valid_name = length(regexall(local.az.stream_analytics_stream_input_iothub.regex, local.az.stream_analytics_stream_input_iothub.name)) > 0 && length(local.az.stream_analytics_stream_input_iothub.name) > local.az.stream_analytics_stream_input_iothub.min_length
    }
    subnet = {
      valid_name = length(regexall(local.az.subnet.regex, local.az.subnet.name)) > 0 && length(local.az.subnet.name) > local.az.subnet.min_length
    }
    template_deployment = {
      valid_name = length(regexall(local.az.template_deployment.regex, local.az.template_deployment.name)) > 0 && length(local.az.template_deployment.name) > local.az.template_deployment.min_length
    }
    traffic_manager_profile = {
      valid_name = length(regexall(local.az.traffic_manager_profile.regex, local.az.traffic_manager_profile.name)) > 0 && length(local.az.traffic_manager_profile.name) > local.az.traffic_manager_profile.min_length
    }
    user_assigned_identity = {
      valid_name = length(regexall(local.az.user_assigned_identity.regex, local.az.user_assigned_identity.name)) > 0 && length(local.az.user_assigned_identity.name) > local.az.user_assigned_identity.min_length
    }
    virtual_machine = {
      valid_name = length(regexall(local.az.virtual_machine.regex, local.az.virtual_machine.name)) > 0 && length(local.az.virtual_machine.name) > local.az.virtual_machine.min_length
    }
    virtual_machine_extension = {
      valid_name = length(regexall(local.az.virtual_machine_extension.regex, local.az.virtual_machine_extension.name)) > 0 && length(local.az.virtual_machine_extension.name) > local.az.virtual_machine_extension.min_length
    }
    virtual_machine_scale_set = {
      valid_name = length(regexall(local.az.virtual_machine_scale_set.regex, local.az.virtual_machine_scale_set.name)) > 0 && length(local.az.virtual_machine_scale_set.name) > local.az.virtual_machine_scale_set.min_length
    }
    virtual_machine_scale_set_extension = {
      valid_name = length(regexall(local.az.virtual_machine_scale_set_extension.regex, local.az.virtual_machine_scale_set_extension.name)) > 0 && length(local.az.virtual_machine_scale_set_extension.name) > local.az.virtual_machine_scale_set_extension.min_length
    }
    virtual_network = {
      valid_name = length(regexall(local.az.virtual_network.regex, local.az.virtual_network.name)) > 0 && length(local.az.virtual_network.name) > local.az.virtual_network.min_length
    }
    virtual_network_gateway = {
      valid_name = length(regexall(local.az.virtual_network_gateway.regex, local.az.virtual_network_gateway.name)) > 0 && length(local.az.virtual_network_gateway.name) > local.az.virtual_network_gateway.min_length
    }
    virtual_network_gateway_connection = {
      valid_name = length(regexall(local.az.virtual_network_gateway_connection.regex, local.az.virtual_network_gateway_connection.name)) > 0 && length(local.az.virtual_network_gateway_connection.name) > local.az.virtual_network_gateway_connection.min_length
    }
    virtual_network_peering = {
      valid_name = length(regexall(local.az.virtual_network_peering.regex, local.az.virtual_network_peering.name)) > 0 && length(local.az.virtual_network_peering.name) > local.az.virtual_network_peering.min_length
    }
    virtual_wan = {
      valid_name = length(regexall(local.az.virtual_wan.regex, local.az.virtual_wan.name)) > 0 && length(local.az.virtual_wan.name) > local.az.virtual_wan.min_length
    }
    windows_virtual_machine = {
      valid_name = length(regexall(local.az.windows_virtual_machine.regex, local.az.windows_virtual_machine.name)) > 0 && length(local.az.windows_virtual_machine.name) > local.az.windows_virtual_machine.min_length
    }
    windows_virtual_machine_scale_set = {
      valid_name = length(regexall(local.az.windows_virtual_machine_scale_set.regex, local.az.windows_virtual_machine_scale_set.name)) > 0 && length(local.az.windows_virtual_machine_scale_set.name) > local.az.windows_virtual_machine_scale_set.min_length
    }
  }
}
