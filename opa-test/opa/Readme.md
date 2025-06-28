### OPA Commands
    - For Local Run
    - opa run --server ./opa/appname/policies
    - opa run --server --watch ./opa/appname/
    - opa run --server ./opa/appname/policies  ./opa/appname/testdata


    - Test Run
    -> opa test ./opa/appname/policies ./opa/appname/testdata
    - opa test ./opa/appname/policies ./opa/appname/testdata --coverage


    - Production Run
    -> opa run --server ./opa/appname/policies



        {
            "input": {
                "user": "rahul",
                "resource": "blog",
                "action": "delete"
            }
        }

opa/
├── appname/
│   ├── policies/
│   │   ├── access.rego           # production policy
│   │   ├── access_test.rego      # test logic for access.rego
│   └── testdata/
│       ├── users.json            # used only for testing
│       └── permissions.json


