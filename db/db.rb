
def run_sql( sql_query, params = [] ) # Take a params 2nd argument 
    # params = [] -> set default value of the argument to []
    connection = PG.connect(user: 'postgres', dbname: 'webrpg', password: '3636')

    # Results = connection.exec(sql_query)
    # First Arg
    # Second Arg

    connection.prepare("statement_name", sql_query)
    results = connection.exec_prepared("statement_name", params)

    connection.close
    return results
end