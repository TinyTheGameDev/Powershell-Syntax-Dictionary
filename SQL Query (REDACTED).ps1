function Test-DB {
	#Params
	param(
		[int]
		$retryAttempts,
		[string]
		$servername,
		[string]
		$database
	)
	$retrycounter = 0
	$connectionSuccess = $false
	
	do {
		$global:Connection = New-Object System.Data.SQLClient.SQLConnection
		#$Connection.ConnectionString = "server='$servername';database='$database';trusted_connection=false; integrated security='True'"
		try {
			Write-output "Testing $servername SQL Connection"
			$Connection.ConnectionString = "server='$servername';trusted_connection=false; integrated security='True'"
			$Connection.Open()
			$Connection.Close()
			$connectionStatus = $true
			Write-Output "$servername SQL Connection Successful"
			Write-output ""
			Write-output ""
		} catch {
			Write-Output "$servername SQL Connection Failure - The Things Broken... Retrying to make a connection ($retrycounter / $retryAttempts)"
			$connectionStatus = $false
			$retrycounter++
			Start-Sleep -s 3
		}
	} while ($connectionStatus -eq $false -and $retrycounter -le $retryAttempts)
	
	if(!($connectionStatus)) {
		Write-output "$servername SQL Connection failure - Things are most Definitely broken."
		cmd /c pause
		Exit
	}
	
}

function Connect-To-DB {
	#Params
	param(
		[string]
		$servername,
		[string]
		$database
	)

	$global:Connection = New-Object System.Data.SQLClient.SQLConnection
	#$Connection.ConnectionString = "server='$servername';database='$database';trusted_connection=false; integrated security='True'"
	Write-output "Opening $servername SQL Connection"
	$Connection.ConnectionString = "server='$servername';trusted_connection=false; integrated security='True'"
	$Connection.Open()
	Write-Output "$servername SQL Connection Successful"
}

function ExecuteSqlQuery {
    # define parameters
    param(
        [string]
        $sqlquery
    )
    Begin {
        If (!$Connection) {
            Throw "No connection to the database detected. Run command ConnectToDB first."
        }
        elseif ($Connection.State -eq 'Closed') {
            Write-Verbose 'Connection to the database is closed. Re-opening connection...'
            try {
                # if connection was closed (by an error in the previous script) then try reopen it for this query
                $Connection.Open()
            }
            catch {
                Write-Verbose "Error re-opening connection. Removing connection variable."
                Remove-Variable -Scope Global -Name Connection
                throw "Unable to re-open connection to the database. Please reconnect using the ConnectToDB commandlet. Error is $($_.exception)."
            }
        }
    }
    Process {
        #$Command = New-Object System.Data.SQLClient.SQLCommand
        $command = $Connection.CreateCommand()
        $command.CommandText = $sqlquery
        Write-Verbose "Running SQL query '$sqlquery'"
        try {
            $result = $command.ExecuteReader()
        }
        catch {
            $Connection.Close()
        }
        $Datatable = New-Object "System.Data.Datatable"
        $Datatable.Load($result)
        return $Datatable
    }
    End {
        Write-Verbose "Finished running SQL query."
    }
}

#Test DB Connection
Test-DB -retryAttempts 5 -servername 'SERVER' -database 'DATABASE'

#Open SQL Connection
Connect-To-DB -servername 'SERVER' -database 'DATABASE'

#Query for Document Category *QUERY EXAMPLE*
$QueryResult = ExecuteSqlQuery -sqlquery "
Select *
FROM PLACE
WHERE THINGS = THINGS
" | Select-Object -ExpandProperty COLUMN

Write-output "Results are: $($QueryResults)"

#Close SQL Connection
$connection.Close()