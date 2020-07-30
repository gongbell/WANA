#include "fairdicelogs.hpp"

void fairdicelogs::result(st_result result) {
    require_auth(FAIR_DICE_GAME);
    require_recipient(result.player);
}
