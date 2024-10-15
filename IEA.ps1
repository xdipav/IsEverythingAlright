# Insert your URL`s and IP`s
$urls = @(
    "https://google.com",
    "https://amazon.com",
    "https://yahoo.com"
)

$ips = @(
    "142.250.191.46"
)

# Color codes for the console
$colorGreen = 92
$colorRed = 91

# Function to display the current time in the certain format: [hours:minutes:seconds]
function Get-FormattedTimestamp {
    return "[{0:HH:mm:ss}]" -f (Get-Date)
}

# Function to validate the SSL certificate
function Validate-SSLCertificate {
    param (
        [string] $url
    )

    try {
        # Creating a WebRequest object for the URL
        $request = [System.Net.WebRequest]::Create($url)
        
        # Disable certificate validation
        $request.ServerCertificateValidationCallback = { $true }
        
        # Send the request and write the response
        $response = $request.GetResponse()
        
        # Close the response
        $response.Close()
        
        return $true
    } catch {
        return $false
    }
}

# Function to check the availability of IP addresses
function Test-IPAddress {
    param (
        [string] $ipAddress
    )

    try {
        # Use Test-Connection to check IP availability
        $result = Test-Connection -ComputerName $ipAddress -Count 1 -Quiet
        return $result
    } catch {
        return $false
    }
}

# Infinite loop to repeat every 15 seconds(change in the end of the code if needed)
while ($true) {
    # Clear the console screen before each iteration
    Clear-Host
    
    # Check URLs
    foreach ($url in $urls) {
        Write-Host "$(Get-FormattedTimestamp) Testing: $url"

        try {
            # Perform HTTP request and measure time
            $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
            $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 10
            $elapsedTime = $stopwatch.ElapsedMilliseconds
            Write-Host "Load time: $elapsedTime ms"

            # Check status and output result
            if ($response.StatusCode -eq 200) {
                Write-Host -NoNewline "Status code: "
                Write-Host -NoNewline "$($response.StatusCode)" -ForegroundColor Green
                Write-Host " (Online)" -ForegroundColor Green
                
                # Check the SSL certificate only if the site is available
                $certValid = Validate-SSLCertificate -url $url
                if ($certValid) {
                    Write-Host -NoNewline "SSL certificate: "
                    Write-Host -NoNewline "Valid" -ForegroundColor Green
                    Write-Host ""  # newline after printing SSL certificate status
                } else {
                    Write-Host -NoNewline "SSL certificate: "
                    Write-Host -NoNewline "Invalid" -ForegroundColor Red
                    Write-Host ""  # newline after printing SSL certificate status
                }
            } else {
                Write-Host -NoNewline "Status code: "
                Write-Host -NoNewline "$($response.StatusCode)" -ForegroundColor Red
                Write-Host " (Offline)" -ForegroundColor Red
            }
        } catch {
            Write-Host "$(Get-FormattedTimestamp) Error while loading! $_" -ForegroundColor Red
        }
        
        Write-Host ""  # newline after processing each URL
    }
    
    # Check IP addresses
    foreach ($ip in $ips) {
        Write-Host "$(Get-FormattedTimestamp) Testing IP: $ip"
        
        $isOnline = Test-IPAddress -ipAddress $ip
        if ($isOnline) {
            Write-Host "IP Address: $ip - Online" -ForegroundColor Green
        } else {
            Write-Host "IP Address: $ip - Offline" -ForegroundColor Red
        }
        
        Write-Host ""  # newline after processing each IP
    }
    $cat = @"
  /\_/\  
 ( o.o ) Is
  > ^ < Everything
 /     \ Alright?
(       )
 \_____/
"@

Write-Host $cat -ForegroundColor Magenta

    # Pause for 15 seconds before the next execution
    Start-Sleep -Seconds 15
}
