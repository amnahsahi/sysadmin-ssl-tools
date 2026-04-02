# sysadmin-ssl-tools

Practical Bash scripts for monitoring, inspecting, and managing SSL certificates using OpenSSL.

Designed for sysadmins and DevOps engineers who want simple, reliable CLI tools without heavy dependencies.

---

## Features

- Check SSL certificate expiry for a domain
- Monitor multiple domains at once
- Inspect full certificate details
- View certificate chains
- Basic certificate renewal helper (Let's Encrypt)
- Cron-friendly reporting output

---

## Requirements

- bash
- openssl
- coreutils (date, cut, etc.)
- (optional) certbot for renewal

---

## Scripts

### check-ssl-expiry.sh
Check expiry date and remaining days for a domain.

```bash
./check-ssl-expiry.sh example.com
```
---
## Cron Example 
0 2 * * * /path/check-multiple-ssl.sh domains.txt
