## Launch dev env

```bash
docker-compose up # term1
./manage/dev/start_bash # term2
```

## Create user

```
User.create(email: "admin@example.com", password: "password", first_name: "Admin", last_name: "User")
```

## Fontawesome

v3.6 below although app uses v5 but still useful

https://khan.github.io/Font-Awesome/cheatsheet/


## Change default locales later

https://github.com/TrestleAdmin/trestle/blob/master/config/locales/fr.yml

## Authorization

v0.5 of `trestle-auth` will handle authorization. Meanwhile, check those URLs for basic temp solutions.

- https://github.com/TrestleAdmin/trestle-auth/issues/21
- https://github.com/TrestleAdmin/trestle-auth/tree/authorization

## Usefull links

- https://github.com/TrestleAdmin/RailsFlixDemo
- https://github.com/TrestleAdmin/trestle/wiki/Has-Many-Relationship-Tab
- https://github.com/TrestleAdmin/trestle/wiki/How-to:-Populate-a-select-dynamically
- [nested resource](https://github.com/TrestleAdmin/trestle/issues/19)
- https://github.com/TrestleAdmin/trestle/wiki/Sorting-Options

## To try

- https://github.com/TrestleAdmin/trestle/issues/7
- ./bin/rails trestle:admin --help
