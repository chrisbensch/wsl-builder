#!/usr/bin/env python

import subprocess
import PySimpleGUI as sg

#  powershell -exec bypass .\Install-Kali-RollingWSLv2.ps1 Kali C:\Tools\Kali attacker true


# Subprocess test example
#IPINFO = "ipconfig"
#results_ip = subprocess.check_output(IPINFO, shell=True)
#print (results_ip)

def gen_autopsy_case():
    print("Inside gen_autopsy_case")


def gen_super_timeline():
    print("Inside gen_super_timeline")


def gen_volatility_data():
    print("Inside gen_volatitlity_data")


def main():
    #sg.theme('TanBlue')

    layout = [
        [sg.Text('Distro Given Name', size=(15, 1), justification='right'),
         sg.InputText('SIFT/Kali', key='case')],
        [sg.Text('Install Directory', size=(15, 1), justification='right'),
         sg.InputText('C:\Tools\Kali', key='dskimg'), sg.FileBrowse()],
        [sg.Text('Username', size=(15, 1), justification='right'),
         sg.InputText('sift/attacker', key='memimg'), sg.FileBrowse()],

        [sg.Checkbox('Full Software Install', key='s1')],

        [sg.Text(' ' * 40), sg.Button('Go!'),
         sg.Button('Exit')]
        # sg.Text(' ' * 40), sg.Button('SaveSettings'), sg.Button('LoadSettings')]
    ]

    window = sg.Window('WSL Builder', layout,
                       default_element_size=(40, 1), grab_anywhere=False)

    while True:
        event, values = window.read()

        #if event == 'SaveSettings':
        #    filename = sg.popup_get_file(
        #        'Save Settings', save_as=True, no_window=True)
        #    window.SaveToDisk(filename)
        #    # save(values)
        #elif event == 'LoadSettings':
        #    filename = sg.popup_get_file('Load Settings', no_window=True)
        #    window.LoadFromDisk(filename)
        #    # load(form)
        #elif event in ('Exit', None):
        if event in ('Exit', None):
            break

    window.close()


if __name__ == '__main__':
    main()

    gen_autopsy_case()
    gen_super_timeline()
    gen_volatility_data()
