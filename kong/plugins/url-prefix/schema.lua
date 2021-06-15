local typedefs = require "kong.db.schema.typedefs"


return {
  name = "url-prefix",
  fields = {
    {
      -- this plugin will only be applied to Services or Routes
      consumer = typedefs.no_consumer
    },
    {
      config = {
        type = "record",
        fields = {
          {
            prefix = {
              type = "string",
              required = false,
            },
          }
        },
      },
    },
  },
  entity_checks = {
    -- Describe your plugin's entity validation rules
  },
}
