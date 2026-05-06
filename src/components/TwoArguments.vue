<template>
    <div class="two-arguments-card">
        <div class="column left">
            <slot name="left"></slot>
        </div>
        <div class="column right">
            <slot name="right"></slot>
        </div>
    </div>
</template>

<script setup></script>
<style scoped>
.two-arguments-card {
    display: flex;
    gap: 20px;
    border: 1px solid #ddd;
    border-radius: 12px;
    padding: 20px;
    background: white;
    max-width: 800px;

    /* Center the card */
    margin: 40px auto; /* top-bottom spacing + horizontal centering */
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
}

.column {
    flex: 1;
    padding: 10px;
    border-radius: 8px;
}

.left {
    background: #ffebee; /* red-ish for "against" tone */
}

.right {
    background: #ffe0b2; /* orange-ish for contrast */
}

/* Optional: responsive stack for small screens */
@media (max-width: 600px) {
    .two-arguments-card {
        flex-direction: column;
    }
}
</style>
