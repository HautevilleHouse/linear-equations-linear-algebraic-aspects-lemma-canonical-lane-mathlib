import canonicalLaneMathlib.AdmissibleClass
import LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean.BasisRepresentation

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure DimensionTheoremPackage {V : LinearSpace} (B : BasisRepresentationPackage V) where
  dimensionDefined : Prop
  basisCardinalityInvariant : Prop
  finiteDimensionalCase : Prop
  infiniteDimensionalCase : Prop

structure DimensionTheoremEvidence {V : LinearSpace} {B : BasisRepresentationPackage V} (D : DimensionTheoremPackage B) where
  dimensionDefinedClosed : D.dimensionDefined
  basisCardinalityInvariantClosed : D.basisCardinalityInvariant
  finiteDimensionalCaseClosed : D.finiteDimensionalCase
  infiniteDimensionalCaseClosed : D.infiniteDimensionalCase

def DimensionTheoremClosed {V : LinearSpace} {B : BasisRepresentationPackage V} (D : DimensionTheoremPackage B) : Prop :=
  D.dimensionDefined ∧ D.basisCardinalityInvariant ∧ D.finiteDimensionalCase ∧ D.infiniteDimensionalCase

theorem dimension_theorem_closed_from_evidence {V : LinearSpace} {B : BasisRepresentationPackage V} (D : DimensionTheoremPackage B) (E : DimensionTheoremEvidence D) : DimensionTheoremClosed D := by
  exact And.intro E.dimensionDefinedClosed (And.intro E.basisCardinalityInvariantClosed (And.intro E.finiteDimensionalCaseClosed E.infiniteDimensionalCaseClosed))

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse