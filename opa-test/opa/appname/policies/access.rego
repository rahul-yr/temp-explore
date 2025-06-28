package appname.policies.access

# defaults
default allow = false

# allow: returns true if user's role allows the action on resource
allow if{
    some role
    user := input.user
    resource := input.resource
    action := input.action

    userinfo := data.users[user]
    role = userinfo.roles[_]

    data.permissions[role][resource][action]==true
}
