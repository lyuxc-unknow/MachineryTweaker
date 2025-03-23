#priority 1000
#modloaded modular_machinery_reborn

import crafttweaker.api.recipe.IRecipeManager;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.data.MapData;
import crafttweaker.api.recipe.type.Recipe;
import crafttweaker.api.world.Container;

public class MachineryRecipeManager {
    public static addRecipe(builder as MachineryRecipeBuilder) as void {
        println(builder.getRecipe().getAsString());
        <recipetype:modular_machinery_reborn:machine_recipe>.addJsonRecipe(DataConvertUtils.recipesName(), builder.getRecipe());
    }
}