
import sys
import os

sys.path.append(os.path.join(os.path.dirname(__file__), "libs", "texto_magico"))

from operacoes import inverter_texto, gritar_texto


def menu():
    print("\nO que voce quer fazer?")
    print("1) Inverter texto")
    print("2) Gritar texto")
    print("0) Sair")
    return input("> ").strip()


def main():
    print("=== texto-magico-cli ===")

    while True:
        opcao = menu()

        if opcao == "1":
            texto = input("Digite o texto: ")
            print(inverter_texto(texto))
        elif opcao == "2":
            texto = input("Digite o texto: ")
            print(gritar_texto(texto))
        elif opcao == "0":
            print("Encerrando programa...")
            break
        else:
            print("Opcao invalida.")


if __name__ == "__main__":
    main()