#include "cms.hpp"

namespace eosio {

    void netkiller::create(account_name author, string title, string content)
    {
        require_auth( author );
        table articles( _self, _self);
        articles.emplace(author, [&]( auto & d){
            d.title = title;
            d.content = content;
            d.id = articles.available_primary_key();
            d.author = author;
        });
    }

    void netkiller::change(account_name author, uint64_t id, string title, string content)
    {
        require_auth(author);
        table articles( _self, author);
        auto post = articles.find(id);
        eosio_assert(post->author == author, "The author name is not correct");
        articles.modify(post, author, [&](auto& p){
            if (title != "")
                p.title = title;
            if (content != "")
                p.content = content;
        });
    }

    void netkiller::remove(account_name author, uint64_t id)
    {
        require_auth(author);
        table articles( _self, author);
        auto post = articles.find(id);
        eosio::print(post->title.c_str());

        eosio_assert(post->author == author, "The user name is correct");
        articles.erase(post);
    }

    void netkiller::query(account_name author, uint64_t id){
        table articles(_self, _self);
        auto post_da = articles.find( id);
        eosio::print("Post_id: ", post_da->id, "  Post_Tile: ", post_da->title.c_str(), " Content: ", post_da->content.c_str());

        auto author_index = articles.template get_index<N(byauthor)>();
        auto pos = author_index.find( author );

        for (; pos != author_index.end(); pos++)
        {
            eosio::print("content:", pos->content.c_str(), " id:", pos->id, " title:", pos->title.c_str());
        }
    }
    void netkiller::find( uint64_t id){
	table articles(_self, _self);
	auto post = articles.find( id);
        eosio::print("id: ", post->id, " Tile: ", post->title.c_str(), " Content: ", post->content.c_str());
    }
}
EOSIO_ABI(eosio::netkiller, (create)(change)(remove)(query)(find))
