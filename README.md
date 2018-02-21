# test-generic-lens

This repository contains the code from my investigation into whether the
[generic-lens][stck-gl] library solved one of the remaining problems in my
dissertation project: name clashes.

The Protocol Buffer specification was clearly written with object oriented
programming in mind, in particular requiring some sort of scoped naming.
While I can simulate that for a single generated file in Haskell, resolving
conflicting names is still messy (though it is possible with the extension
DuplicateRecordFields).  Further, I wanted to provide an object-like API via
lenses which cannot be resolved the same way.  It might be possible using
`[makeFieldsNoPrefix][hck-mfnp]` but that would still fail in the presence of
identically named fields from several packages.

I had given up hope and was going to just leave the user to choose how to
handle the naming conflicts, but then discovered generic-lens just in time!
Using its (currently-unreleased) Data.Generics.Labels module, I can achieve
almost the exact API I am looking for in a way that is compatible across
package boundaries.

The only downside is that it uses an orphan instance that could potentially
conflict with any other instance of IsLabel for any type congruent with the
van Laarhoven encoding of lenses (the encoding used by both the `lens` and
`microlens` libraries, among others).  Well, and the `#` from the
OverloadedLabels syntax but that's not too big a deal.
