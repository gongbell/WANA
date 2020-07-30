#include "test.da/test_da.hpp"

namespace eosio {

    void test_da::create(account_name user, string title, string content)
    {
        require_auth( user );
        das datable( _self, _self);
        datable.emplace(user, [&]( da & d){
            d.title = title;
            d.content = content;
            d.post_id = datable.available_primary_key();
            d.poster = user;
        });
    }

    void test_da::change(account_name user, uint64_t post_id, string title, string content)
    {
        require_auth(user);
        das datable( _self, user);
        auto post = datable.find(post_id);
        eosio_assert(post->poster == user, "yonghucuowu");
        datable.modify(post, user, [&](auto& p){
            if (title != "")
                p.title = title;
            if (content != "")
                p.content = content;
        });
    }

    void test_da::dele(account_name user, uint64_t post_id)
    {
        require_auth(user);
        das datable( _self, user);
        auto post = datable.find(post_id);
        eosio::print(post->title.c_str());

        eosio_assert(post->poster == user, "yonghucuowu");
        datable.erase(post);
    }

    void test_da::getd(uint64_t post_id, account_name user){
        das datable(_self, _self);
        auto post_da = datable.find( post_id);
        eosio::print("Post_id: ", post_da->post_id, "  Post_Tile: ", post_da->title.c_str(), " Content: ", post_da->content.c_str());

        auto poster_index = datable.template get_index<N(byposter)>();
        auto pos = poster_index.find( user );

        for (; pos != poster_index.end(); pos++)
        {
            eosio::print("content:", pos->content.c_str(), " post_id:", pos->post_id, " title:", pos->title.c_str());
        }
    }

}
EOSIO_ABI(eosio::test_da, (create)(change)(dele)(getd))
