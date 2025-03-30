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
    public static requireEnergy(amount as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return energy(amount, "input", x, y);
    }

    public static produceEnergy(amount as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return energy(amount, "output", x, y);
    }
    
    public static requireItem(ingredient as IIngredient, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return item(ingredient, "input", 1.0, x, y);
    }

    public static requireItem(ingredient as IIngredient, chance as double, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return item(ingredient, "input", chance, x, y);
    }

    public static produceItem(ingredient as IIngredient, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return item(ingredient, "output", 1.0, x, y);
    }

    public static produceItem(ingredient as IIngredient, chance as double, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return item(ingredient, "output", chance, x, y);
    }

    public static requireFluid(fluidstack as IFluidStack, x as int, y as int) as MacgineryRecipeType {
        return fluid(fluidstack, "input", 1.0, x, y);
    }

    public static requireFluid(fluidstack as IFluidStack, chance as double, x as int, y as int) as MacgineryRecipeType {
        return fluid(fluidstack, "input", chance, x, y);
    }

    public static produceFluid(fluidstack as IFluidStack, x as int, y as int) as MacgineryRecipeType {
        return fluid(fluidstack, "output", 1.0, x, y);
    }

    public static produceFluid(fluidstack as IFluidStack, chance as double, x as int, y as int) as MacgineryRecipeType {
        return fluid(fluidstack, "output", chance, x, y);
    }

    public static requireExperience(amount as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return experience(amount, "input", x, y);
    }

    public static produceExperience(amount as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return experience(amount, "output", x, y);
    }

    public static requireChemical(chemicalInput as string, amount as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return chemical(chemicalInput,amount,"input",1.0,x,y);
    }

    public static requireChemical(chemicalInput as string, amount as int, chance as double, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return chemical(chemicalInput,amount,"input",chance,x,y);
    }

    public static produceChemical(chemicalInput as string, amount as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return chemical(chemicalInput,amount,"output",1.0,x,y);
    }

    public static produceChemical(chemicalInput as string, amount as int, chance as double, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return chemical(chemicalInput,amount,"output",chance,x,y);
    }

    public static requireSource(amount as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return source(amount,"input",1.0,x,y);
    }

    public static requireSource(amount as int, chance as double, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return source(amount,"input",chance,x,y);
    }

    public static produceSource(amount as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return source(amount,"output",1.0,x,y);
    }

    public static produceSource(amount as int, chance as double, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return source(amount,"output",chance,x,y);
    }

    public static dimension(filterArray as string[], blacklist as bool = false, x as int, y as int) as MacgineryRecipeType {
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

    public static dimension(filterArray as string[], x as int = 0, y as int = 0) as MacgineryRecipeType {
        return dimension(filterArray,false,x,y);
    }

    public static biome(filterArray as string[], blacklist as bool, x as int, y as int) as MacgineryRecipeType {
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

    public static biome(filterArray as string[], x as int = 0, y as int = 0) as MacgineryRecipeType {
        return biome(filterArray,false,x,y);
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

    public static duration(time as int, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("duration", {
            "time": time,
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

    public static lootTable(table as string, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return lootTable(table,0.0,x,y);
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

    private static energy(amount as int, mode as string, x as int, y as int) as MacgineryRecipeType {
        return new MacgineryRecipeType("energy", {
            "mode": mode,
            "amount": amount,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    private static item(ingredient as IIngredient, mode as string, chance as double,x as int, y as int) as MacgineryRecipeType {
        return new MacgineryRecipeType("item", {
            "mode": mode,
            "sizedIngredient": {
                "ingredient": ingredient as IData
            },
            "chance": chance,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    private static fluid(fluidstack as IFluidStack, mode as string, chance as double, x as int, y as int) as MacgineryRecipeType {
        return new MacgineryRecipeType("fluid", {
            "mode": mode,
            "fluid": fluidstack.fluid.registryName.toString(),
            "amount": fluidstack.amount,
            "chance": chance,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    private static experience(amount as int, mode as string, x as int, y as int) as MacgineryRecipeType {
        return new MacgineryRecipeType("experience", {
            "mode": mode,
            "amount": amount,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    private static chemical(chemicalInput as string, amount as int, mode as string = "input", chance as double, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("chemical", {
            "mode": mode,
            "chemical": {"chemical": chemicalInput},
            "amount": amount,
            "chance": chance,
            "position": {
                "x": x,
                "y": y
            }
        });
    }

    private static source(amount as int, mode as string = "input", chance as double, x as int = 0, y as int = 0) as MacgineryRecipeType {
        return new MacgineryRecipeType("source", {
            "mode": mode,
            "source": amount,
            "chance": chance,
            "position": {
                "x": x,
                "y": y
            }
        });
    }
}