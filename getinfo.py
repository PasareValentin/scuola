if __name__ == "__main__":
    import platform
    import os
    import time
    with open ("g.csv", "w") as f_out:
        piattaforma = platform.platform()
        tempo = time.time()
        machine = platform.machine()
        system = platform.system()
        computer_name = os.getenv("computername")
        f_out.write(piattaforma + "\n")
        f_out.write(str(tempo) + "\n")
        f_out.write(machine + "\n")
        f_out.write(system + "\n")
        f_out.write(computer_name + "\n")
