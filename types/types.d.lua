--- @meta

--- @class What.Configuration.Progress
--- @field label string

--- @class What.Configuration.Prop
--- @field name string

--- @class What.Configuration.UsableJob
--- @field all boolean
--- @field list? table<What.Configuration.UsableJob.Name, What.Configuration.UsableJob.Grade | What.Configuration.UsableJob.AllGrade>

--- @alias What.Configuration.UsableWhenHasAnyItem table<string, integer>
--- @alias What.Configuration.UsableJob.Name string
--- @alias What.Configuration.UsableJob.Grade table<integer, boolean>
--- @alias What.Configuration.UsableJob.AllGrade table<'all', boolean>
--- @alias What.Configuration.UsableJob.List boolean
--- @alias What.Notify.TypeInt 1 | 2 | 3
--- @alias What.Notify.TypeText 'success' | 'error' | 'info'