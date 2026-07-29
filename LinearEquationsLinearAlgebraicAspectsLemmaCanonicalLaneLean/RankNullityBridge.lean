import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean

structure RankNullityPackage where
  linearMap : Type u → Type v
  domainDim : Nat
  codomainDim : Nat
  rank : Nat
  nullity : Nat
  rankPlusNullityEqDomainDim : rank + nullity = domainDim

structure RankNullityEvidence (R : RankNullityPackage) where
  rankPlusNullityEqDomainDimClosed : R.rank + R.nullity = R.domainDim

def RankNullityClosed (R : RankNullityPackage) : Prop :=
  R.rank + R.nullity = R.domainDim

theorem rank_nullity_closed_from_evidence (R : RankNullityPackage) (E : RankNullityEvidence R) : RankNullityClosed R := by
  exact E.rankPlusNullityEqDomainDimClosed

end LinearEquationsLinearAlgebraicAspectsLemmaCanonicalLaneLean
end HautevilleHouse