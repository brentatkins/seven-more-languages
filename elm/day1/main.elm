module Main exposing (innerProduct, multiply, product, productFold, productFold2)


multiply x y =
    x * y


innerProduct ls state =
    case ls of
        head :: tail ->
            innerProduct tail (state * head)

        [] ->
            state


product ls =
    case ls of
        head :: tail ->
            innerProduct tail (state * head)

        [] ->
            state


productFold ls =
    List.foldl multiply 1 ls


productFold2 ls =
    List.foldl * 1 ls


getx ls =
    List.map .x ls


person =
    { name = "Some name", age = 19, address = { line1 = "address line 1", postcode = "23312" } }


personList =
    [ { name = "name 1", age = 25 }
    , { name = "name 2", age = 7 }
    , { name = "name 3", age = 50 }
    , { name = "name 4", age = 15 }
    ]


youngerThan16 ls =
    ls
        |> List.filter (\x -> x.age < 16)
        |> List.map .name


personListHard =
    [ { name = "name 1", age = Just 25 }
    , { name = "name 2", age = Just 7 }
    , { name = "name 3", age = Nothing }
    , { name = "name 4", age = Just 15 }
    ]


isOld person =
    case person.age of
        Nothing ->
            False

        Just age ->
            age > 16


oldies ls =
    ls
        |> List.filter isOld
        |> List.map .name
