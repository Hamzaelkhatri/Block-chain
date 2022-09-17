package main

import (
	"fmt"
	"io/fs"

	// "log"
	"os"
	"os/exec"
)

func commandHelp() {
	fmt.Println("NAME:\nclillet - the multicurrency wallet\nCopyright 2022-today The authors of clillet\n")
	fmt.Println("USAGE:\nclillet [options] [command] [<arguments>...]\n")
	fmt.Println("COMMANDS:\ngenerate                      Generates a new wallet and prints the mnemonic\nimport <file>                 Imports a wallet from a file\nexport <file>                 Export the wallet to a file\nconnect <endpoint>            Connect to a blockchain node\nbalance                       Get the balance for the current loaded wallet\nsend <destination> <amount>   sends assets to a destination")
}

func executeCmd(args ...string) {
	cmd := exec.Command("node", args...)
	output, _ := cmd.CombinedOutput()
	// if err != nil {
	// 	log.Fatal(err)
	// }
	fmt.Printf("\n%s\n", string(output))
}

func main() {

	if len(os.Args) < 2 || os.Args[1] == "--help" {
		commandHelp()
		return
	}
	entrypoint, _ := fs.ReadFile(os.DirFS("."), ".entrypoint")

	if os.Args[1] == "generate" {
		executeCmd("createWallet.js")
	} else if os.Args[1] == "info" {
		executeCmd("getWalletInfo.js", string(entrypoint))
	} else if os.Args[1] == "balance" {
		executeCmd("getBalance.js", string(entrypoint))
	} else if os.Args[1] == "import" && len(os.Args) >= 3 {
		bytes, _ := os.ReadFile(os.Args[2])
		os.WriteFile("data.json", bytes, fs.FileMode(os.O_TRUNC))
		fmt.Print("imported", bytes)
	} else if os.Args[1] == "export" && len(os.Args) >= 3 {
		bytes, _ := os.ReadFile("data.json")
		os.WriteFile(os.Args[2], bytes, fs.FileMode(os.O_TRUNC)|fs.FileMode(os.O_CREATE)|fs.FileMode(os.O_WRONLY))
		fmt.Print("exported", bytes)
	} else if os.Args[1] == "connect" {
		executeCmd("getWalletInfo.js", os.Args[2])
		os.WriteFile(".entrypoint", []byte(os.Args[2]), fs.FileMode(os.O_TRUNC))
	} else if os.Args[1] == "send" && len(os.Args) >= 4 {
		executeCmd("send.js", string(entrypoint), os.Args[2], os.Args[3])
	} else {
		commandHelp()
	}
}
