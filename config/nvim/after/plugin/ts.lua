-- local angularEmbeddedTemplates = vim.treestiter.parse_query([[
-- (decorator
--   (call_expression
--     function: (identifier) @decoratorName (#eq? @decoratorName "Component")
--     arguments: (arguments
--                  (object
--                    (pair
--                      key: (property_identifier) @decoratorProperty (#eq? @decoratorProperty "template")
--                      value: (template_string) @templateValue
--                      )
--                    )
--                  )
--     )
--   )
--   ]])