package generator

import (
	"fmt"

	"android/soong/android"
)

func evolutionExpandVariables(ctx android.ModuleContext, in string) string {
	evolutionVars := ctx.Config().VendorConfig("evolutionVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if evolutionVars.IsSet(name) {
			return evolutionVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
