def run_sql( sql_query, params = [] )
    connection = PG.connect(user: 'postgres', dbname: 'webrpg', password: '3636')
    connection.prepare("statement_name", sql_query)
    results = connection.exec_prepared("statement_name", params)
    connection.close
    return results
end