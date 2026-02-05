lettere = ["A", "T", "C", "G"]
contatore_t = 0
presente_c = False
dna_l = []
while True:
    dna = input("Inserisci il segmento di DNA (solo A, T, C, G): ").upper()
    valido = True
    for c in dna:
        if c not in lettere:
            valido = False
            break
    if valido:
        break
    else:
        print("Errore: il DNA contiene caratteri non validi.")
for carattere in dna:
    if carattere == "T":
        contatore_t += 1
    if carattere == "C":
        presente_c = True
frequenza_t = contatore_t / len(dna)
for carattere in dna:
    if carattere == "A":
        dna_l.append("Adenina")
    elif carattere == "T":
        dna_l.append("Timina")
    elif carattere == "C":
        dna_l.append("Citosina")
    elif carattere == "G":
        dna_l.append("Guanina")
print (dna)
print (contatore_t)
print (frequenza_t)
if presente_c == True:
    print ("Citosina presente")
else:
    print ("Citosina non presente")
print (dna_l)