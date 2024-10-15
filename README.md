# IsEverythingAlright🙀
Handy powershell script for admins to monitor comany`s things :)

A simple and handy tool for administrators🧔🏻‍♂️ and script-kids🧒🏻 to monitor the status of their favorite websites and IP addresses. This PowerShell script checks the availability of specified URLs and IP addresses, displaying the results in a colorful and easy-to-read format in the most popular OS on the planet🌍🪟

# What it does:

- Checks the status code of each URL and displays whether it's online or offline 🛜
- Measures the load time of each URL ⏱️
- Validates the SSL certificate of each URL (if online) 🔒
- Checks the availability of specified IP addresses 📊
- Displays the results in a console-friendly format with green (online) and red (offline) colors 🌈
- Includes a cute assistant to brighten up your day 🐱

# How it works:

1. The script runs in an infinite loop, checking the URLs and IP addresses every 15 seconds (configurable) ⌛
2. For each URL, it sends an HTTP request and measures the load time ⏱️
3. If the URL is online, it checks the SSL certificate validity ✅
4. For each IP address, it uses the Test-Connection cmdlet to check its availability 📶
5. The results are displayed in the console, with green indicating online and red indicating offline 🔍

# Usage:

1. Update the $urls and $ips arrays with 🫵🏻YOUR🫵🏻 URLs and IP addresses.
2. Run the script in PowerShell.
3. Sit back and relax while the script monitors your websites and IP addresses 😌.
4. **Optionally:** Add the script on autostart, so it will appear every time automatically! 🔁

# Gallery
![Знімок екрана 2024-10-15 151156](https://github.com/user-attachments/assets/5790244f-d77a-4754-bb22-fac1779b8b7d)

```
“The absurd is lucid reason noting its limits.”
― Albert Camus
```
