import requests
import colorama
from colorama import Fore, Style

colorama.init()

def check_nitro(token):
    headers = {'Authorization': token}
    
    try:
        response = requests.get('https://discord.com/api/v9/users/@me', headers=headers)
        if response.status_code == 200:
            nitro_status = response.json().get('premium_type', 0)
            return nitro_status
        else:
            return None
    except:
        return None

def main():
    print(f"{Fore.YELLOW}Discord Nitro Bulk Checker (For 'Server Reward Distribution'){Style.RESET_ALL}")
    
    with open('codes.txt', 'r') as file:
        tokens = [line.strip() for line in file if line.strip()]
    
    working = []
    
    for token in tokens:
        nitro_type = check_nitro(token)
        
        if nitro_type == 1:
            print(f"{Fore.GREEN}VALID NITRO CLASSIC: {token[:20]}...{Style.RESET_ALL}")
            working.append(token)
        elif nitro_type == 2:
            print(f"{Fore.BLUE}VALID NITRO BOOST: {token[:20]}...{Style.RESET_ALL}")
            working.append(token)
        else:
            print(f"{Fore.RED}INVALID/NO NITRO: {token[:20]}...{Style.RESET_ALL}")
    
    with open('working.txt', 'w') as file:
        for token in working:
            file.write(f"{token}\n")
    
    print(f"\n{Fore.CYAN}Results saved to 'working.txt'!{Style.RESET_ALL}")

if __name__ == "__main__":
    main()