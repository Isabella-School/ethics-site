<script setup>
import { ref } from "vue";
import DriversLicenseContainer from "./components/DriversLicenseContainer.vue";
import SectionHeader from "./components/SectionHeader.vue";
import IntroLayout from "./components/IntroLayout.vue";
import StackSplit from "./components/StackSplit.vue";
import ParagraphBlock from "./components/ParagraphBlock.vue";
import GovActionCard from "./components/GovActionCard.vue";
import StanceCard from "./components/StanceCard.vue";
import colors from "./data/colors.json";
import TwoArguments from "./components/TwoArguments.vue";
import SiteHeader from "./components/SiteHeader.vue";
const showOverlay = ref(false);
const selectedState = ref(null);

function openState(data) {
    selectedState.value = data;
    showOverlay.value = true;
}
</script>
<template>
    <SiteHeader
        title="The treatment of transgender individuals in the United States"
    />
    <StackSplit>
        <SectionHeader title="The Issue" />
        <GovActionCard
            title="Genocide in the United States"
            description="The Lemkin Institute for Genocide Prevention and Human Security has placed the
        United States in “the early to middle stages of a genocidal process against transgender
        people”. Actions in the United States raise profound concerns surrounding how a society treats its marginalized members and the
        persecution of said members"
            citation-text="The Lemkin Institute for Genocide Prevention"
            citation-url="https://www.lemkininstitute.com/red-flag-alerts/red-flag-alert---anti-trans-genocide-in-the-usa---%233"
        />
        <ParagraphBlock
            text="Transgender individuals face ongoing persecution and discrimination in the United States. While technology does indeed open up opportunities for connection and visibility, it can also introduce additional vectors through which harassment and surveillance can occur. At the same time, these same systems are often reclaimed as tools for community building and advocacy creating a complex and uneven digital landscape."
        />
    </StackSplit>
    <StackSplit>
        <SectionHeader title="My Stance" />
    </StackSplit>
    <StackSplit>
        <SectionHeader title="The State" />
        <IntroLayout />
    </StackSplit>

    <StackSplit>
        <SectionHeader title="State Legislation" />
        <ParagraphBlock
            text="Each card contains information about anti-trans legislation in 2026 "
        />
        <DriversLicenseContainer :data="colors" />
    </StackSplit>

    <StackSplit>
        <SectionHeader title="Arguments for The States Position" />

        <TwoArguments>
            <template #left>
                <h3>Utilitarianism - No Special Treatment</h3>
                <p>
                    When discussing access to documents congruent to ones gender
                    identity a utilitarian may argue that cis people don't have
                    the privilege of changing their identification either.
                </p>
            </template>
            <template #right>
                <h3>Practical Considerations</h3>
                <p>
                    Beyond affirmation of identity, congruent documentation
                    lowers real-world barriers in healthcare, employment, and
                    education. For example, by failing to provide correct
                    identification for transgender people, the federal
                    government effectively outs them, which may create blocks in
                    employment and housing.
                </p>
            </template>
        </TwoArguments>
        <TwoArguments>
            <template #left>
                <h3>
                    Consequentialism - The state has a vested interest in the
                    health of its citizens
                </h3>
                <p>
                    A consequentialist may argue that the state should indeed be
                    able to track the healthcare of its citizens to aid in
                    improving public health. For example, the state already does
                    collect statistics regarding vaccination intiatives, how
                    else would the institutions that exist ensure something
                    horrible isn't happening?
                </p>
            </template>
            <template #right>
                <h3>Yes, but not to this degree</h3>
                <p>
                    From a kantian perspective, tracking individuals to better
                    public health treats them as a means to an end, rather than
                    as ends in themselves. Even if it is the greater good, it is
                    morally impermissible to violate a person's autonomy and
                    privacy without their consent. Ethical governence requires
                    that each citizen's dignity be respected, even when pursuing
                    beneficial outcomes.
                </p>
                <p>
                    The argument also assumes that the state views the needs of
                    the group being monitored as part of the public good, which
                    may not be a fair assumption when looking back on American
                    history.
                </p>
            </template>
        </TwoArguments>
    </StackSplit>
</template>

<style scoped>
.DL-container {
    margin: 10px;
    display: flex;
    gap: 15px;
    flex-wrap: wrap;
}
</style>
