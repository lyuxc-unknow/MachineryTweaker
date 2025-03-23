#priority 1000
#modloaded modular_machinery_reborn

import crafttweaker.api.data.MapData;
import crafttweaker.api.data.IData;
import crafttweaker.api.data.ListData;
import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;

public class MachineryRecipeBuilder {
    private var recipe as MapData;

    public this() {
        recipe = {};
    }

    public getRecipe() as MapData => recipe;

    public machine(machineId as string) as MachineryRecipeBuilder {
        recipe.put("machine", machineId);
        return this;
    }

    public recipeTime(time as int) as MachineryRecipeBuilder {
        recipe.put("time", time);
        return this;
    }

    public size(width as int, height as int) as MachineryRecipeBuilder {
        recipe.put("width", width);
        recipe.put("height", height);
        return this;
    }

    public requirement(requirements as MacgineryRecipeType[]) as MachineryRecipeBuilder {
        val requirementList = new ListData();
        for type in requirements {
            requirementList.add(type);
        }
        recipe.put("requirements",requirementList);
        return this;
    }

    public priority(value as int) as MachineryRecipeBuilder {
        recipe.put("priority", value);
        return this;
    }

    public voidFailure(isVoidFailure as bool) as MachineryRecipeBuilder {
        recipe.put("voidFailure", isVoidFailure);
        return this;
    }

    public renderProgress(isRender as bool) as MachineryRecipeBuilder {
        recipe.put("renderProgress", isRender);
        return this;
    }

    public progressPosition(x as int, y as int) as MachineryRecipeBuilder {
        recipe.put("progressPosition",{
            "position": {
                "x": x,
                "y": y
            }
        });
        return this;
    }
}