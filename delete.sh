#!/bin/bash
# ===========================================
# | AUTOSCRIPT FOR INSTALLATION SSH AND VPN |
# ===========================================
# | Owner : Administrator JAGOANNEON    |
# | Group : JAGOANNEON                 |
# | FB : Generasi Ronggolawe Tuban             |
# ===========================================
            
            echo ""

               if [ ! -f /usr/local/bin/deleteduser ]; then
               echo "echo "Autoscript by Jagoanneon"" > /usr/local/bin/deleteduser
               chmod +x /usr/local/bin/deleteduser
               fi
               hariini=`date +%d-%m-%Y`
               echo "Autoscript by JAGOANNEON"
               echo "Thank you for removing the EXPIRED USERS"
               echo "--------------------------------------"
               cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
               totalaccounts=`cat /tmp/expirelist.txt | wc -l`
               for((i=1; i<=$totalaccounts; i++ ))
               do
               tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
               username=`echo $tuserval | cut -f1 -d:`
               userexp=`echo $tuserval | cut -f2 -d:`
               userexpireinseconds=$(( $userexp * 86400 ))
               tglexp=`date -d @$userexpireinseconds`             
               tgl=`echo $tglexp |awk -F" " '{print $3}'`
               while [ ${#tgl} -lt 2 ]
               do
               tgl="0"$tgl
               done
               while [ ${#username} -lt 15 ]
               do
               username=$username" " 
               done
               bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
               echo "echo "jomblossh- User : $username Expire at : $tgl $bulantahun"" >> /usr/local/bin/alluser
               todaystime=`date +%s`
               if [ $userexpireinseconds -ge $todaystime ] ;
               then
		    	:
               else
               echo "echo "jomblossh- Username : $username are expired at: $tgl $bulantahun and removed : $hariini "" >> /usr/local/bin/deleteduser
	           echo "Username $username that are expired at $tgl $bulantahun removed from the VPS $hariini"
               userdel $username
               fi
               done
               echo " "
               echo "--------------------------------------"
               echo "Script are successfully run"
               echo -e ""
read -rp "Tekan enter untuk kembali ke Menu..."
menu
exit 0
fi
