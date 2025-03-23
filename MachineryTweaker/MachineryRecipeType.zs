#priority 1001
#modloaded modular_machinery_reborn

import crafttweaker.api.data.IData;
import crafttweaker.api.data.MapData;
import crafttweaker.api.data.ListData;
import crafttweaker.api.fluid.IFluidStack;
import crafttweaker.api.ingredient.IIngredient;
import stdlib.List;

public class MacgineryRecipeType {
    protected var data as MapData = new MapData();

    public this(type as string, data as MapData) {
        this.data = ({"type": type} as MapData).merge(data);
    }

    public this(data as MapData) {
        this.data.merge(data);
    }
    public asData() as IData => data;
    public implicit as IData => data;
}

public class MacgineryRecipeTypes {
    public static energy(amount as int, mode as string = "input", x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("energy", {
            "mode": mode,
            "amount": amount,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static item(ingredient as IIngredient, mode as string = "input", x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("item", {
            "mode": mode,
            "sizedIngredient": {
                "ingredient": ingredient as IData
            },
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static fluid(fluidstack as IFluidStack, mode as string = "input", x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("fluid", {
            "mode": mode,
            "fluid": fluidstack.fluid.registryName.toString(),
            "amount": fluidstack.amount,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static biome(filterArray as string[], blacklist as bool = false, x as int = 0, y as int = 0) as MacgineryRecipeType {
        val filterList = new ListData();
        for filter in filterArray {
            filterList.add(filter);
        }
        return new MacgineryRecipeType("biome", {
            "filter": filterList,
            "blacklist": blacklist,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static chunkload(radius as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        if (radius > 32) radius = 32;
        if (radius < 1) radius = 1; 
        return new MacgineryRecipeType("chunkload", {
            "radius": radius,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static dimension(filterArray as string[], blacklist as bool = false, x as int = 0, y as int = 0) as MacgineryRecipeType {
        val filterList = new ListData();
        for filter in filterArray {
            filterList.add(filter);
        }
        return new MacgineryRecipeType("dimension", {
            "filter": filterList,
            "blacklist": blacklist,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static duration(time as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("duration", {
            "time": time,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static experience(amount as int, mode as string = "input", x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("experience", {
            "mode": mode,
            "amount": amount,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static lootTable(table as string, luck as double = 0.0f, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("loot_table", {
            "table": table,
            "luck": luck,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    // 需要使用区间的形式进行表达， * 则代表所有时间（无需区间形式）
    public static time(timeRange as string, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("time", {
            "range": timeRange,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static weather(weather as string, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("weather", {
            "weather": weather,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static chemical(chemical as string, amount as int, mode as string = "input", x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("chemical", {
            "mode": mode,
            "chemical": chemical,
            "amount": amount,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    public static source(amount as int, mode as string = "input", x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("source", {
            "mode": mode,
            "source": amount,
            "position": {
                "x": x,
                "y": y
            }
        });
    }
}