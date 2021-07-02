#include <iostream>
using namespace std;

bool isPalindrome(int x) {
    int y = x;
    int rev = 0;
    int digit = 0;
    bool myb = true;

    do
     {
         digit = x % 10;
         rev = (rev * 10) + digit;
         x = x / 10;
     } while (x != 0);

    if (y == rev)
         myb = true;
    else
         myb = false;
    
    return myb;
}

int main() {
    int n;
    cin >>n;
    
    if(isPalindrome(n)) {
        cout <<n<<" is a palindrome";
    }
    else {
        cout << n<<" is NOT a palindrome";
    }
    return 0;
}