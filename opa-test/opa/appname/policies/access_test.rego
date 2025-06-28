package appname.policies.access_test

import data.appname.policies.access.allow

# ✅ Superadmin can delete blog
test_superadmin_can_delete_blog if {
    test_input := {
        "user": "rahul",
        "resource": "blog",
        "action": "delete"
    }
    allow with input as test_input
}

# ✅ Support can read meetup
test_support_can_read_meetup if {
    test_input := {
        "user": "giri",
        "resource": "meetup",
        "action": "read"
    }
    allow with input as test_input
}

# ❌ User cannot delete blog
test_user_cannot_delete_blog if {
    test_input := {
        "user": "harsha",
        "resource": "blog",
        "action": "delete"
    }
    not allow with input as test_input
}

# ❌ Unknown user has no access
test_unknown_user_denied if {
    test_input := {
        "user": "unknown",
        "resource": "blog",
        "action": "read"
    }
    not allow with input as test_input
}
