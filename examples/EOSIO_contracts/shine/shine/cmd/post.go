// Copyright © 2018 NAME HERE <EMAIL ADDRESS>
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package cmd

import (
	"fmt"
	"log"

	eos "github.com/eoscanada/eos-go"
	"github.com/spf13/cobra"
)

// postCmd represents the post command
var postCmd = &cobra.Command{
	Use:  "post -f [account] [to] [memo]",
	Args: cobra.ExactArgs(2),
	Run: func(cmd *cobra.Command, args []string) {
		chainID := make([]byte, 32, 32)
		api := eos.New("http://localhost:8888", chainID)

		api.SetSigner(eos.NewWalletSigner(eos.New("http://localhost:6667", chainID), "default"))

		_, err := api.SignPushActions(
			NewPost(fromAccount, args[0], args[1]),
		)
		if err != nil {
			log.Fatalln(err)
		}
		fmt.Println("post called")
	},
}

func init() {
	RootCmd.AddCommand(postCmd)
}

func NewPost(from, to, memo string) *eos.Action {
	return &eos.Action{
		Account: eos.AccountName("shine"),
		Name:    eos.ActionName("post"),
		Authorization: []eos.PermissionLevel{
			{Actor: eos.AccountName(from), Permission: eos.PermissionName("active")},
		},
		Data: eos.NewActionData(Post{
			From: eos.AccountName(from),
			To:   eos.AccountName(to),
			Memo: memo,
		}),
	}
}

type Post struct {
	From eos.AccountName `json:"from"`
	To   eos.AccountName `json:"to"`
	Memo string          `json:"memo"`
}
