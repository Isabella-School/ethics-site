<template>
    <section class="section">
        <div class="container">
            <div v-if="$slots.top" class="top">
                <slot name="top" />
            </div>

            <div v-if="$slots.divider" class="divider">
                <slot name="divider" />
            </div>

            <div v-if="$slots.bottom" class="bottom">
                <slot name="bottom" />
            </div>

            <!-- fallback if no named slots -->
            <div v-if="!$slots.top && !$slots.bottom">
                <slot />
            </div>
        </div>
    </section>
</template>

<script setup>
// purely structural layout component
</script>

<style scoped>
.section {
    width: 100%;
    padding: 40px 20px;
}

/* centered content column */
.container {
    max-width: 1100px;
    margin: 0 auto;
}

/* vertical spacing */
.top,
.bottom {
    display: flex;
    flex-direction: column;
    gap: 16px;
}

/* optional divider */
.divider {
    margin: 30px 0;
    height: 1px;
    background: rgba(0, 0, 0, 0.08);
}

/* nicer spacing between stacked sections */
.bottom {
    margin-top: 20px;
}
</style>
