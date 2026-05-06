<template>
    <section class="section" :class="{ split }">
        <div v-if="split" class="split-container">
            <div class="left">
                <slot name="left" />
            </div>

            <div class="right">
                <slot name="right" />
            </div>
        </div>

        <div v-else class="full">
            <slot />
        </div>
    </section>
</template>

<script setup>
defineProps({
    split: {
        type: Boolean,
        default: false,
    },
});
</script>

<style scoped>
.section {
    width: 100%;
    padding: 40px 20px;
}

/* FULL WIDTH MODE */
.full {
    max-width: 1100px;
    margin: 0 auto;
}

/* SPLIT MODE */
.split-container {
    max-width: 1100px;
    margin: 0 auto;
    display: flex;
    gap: 32px;
    align-items: flex-start;
}

/* 50/50 split */
.left,
.right {
    flex: 1;
}

/* subtle visual structure */
.right {
    border-left: 1px solid rgba(0, 0, 0, 0.08);
    padding-left: 24px;
}

/* responsive */
@media (max-width: 900px) {
    .split-container {
        flex-direction: column;
    }

    .right {
        border-left: none;
        padding-left: 0;
    }
}
</style>
