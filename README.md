# rails-templates
Everyone should have a template for yourself. And if you need some custom views, just copy and modify.

# Easy to Use
Copy to *#{Rails.root}/lib/templates/*

# Command
Generate admin page includes controller and erb

```
rails g scaffold_controller admin/users
```

You can appoint a ModelName

```
rails g scaffold_controller admin/users_info --model-name=user
```

or skip jbuilder
```
rails g scaffold_controller admin/users_info --model-name=user --jbuilder=false
```
