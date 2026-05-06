<template>
    <header class="site-header">
        <div class="logo">
            <h1>{{ title }}</h1>
        </div>
        <nav class="nav-links" v-if="links && links.length">
            <a
                v-for="(link, index) in links"
                :key="index"
                :href="link.href"
                class="nav-link"
            >
                {{ link.text }}
            </a>
        </nav>
    </header>
</template>

<script setup>
defineProps({
    title: { type: String, default: "My Site" },
    links: { type: Array, default: () => [] }, // [{ text: "Home", href: "/" }]
});
</script>

<style scoped>
.site-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px 24px;
    background: #081a33; /* dark header */
    color: white;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.logo h1 {
    font-size: 1.5rem;
    margin: 0;
}

.nav-links {
    display: flex;
    gap: 20px;
}

.nav-link {
    color: white;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.2s ease;
}

.nav-link:hover {
    color: #ffd166; /* accent color on hover */
}

/* Responsive: stack links under logo on small screens */
@media (max-width: 600px) {
    .site-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
    }
    .nav-links {
        flex-direction: column;
        gap: 8px;
    }
}
</style>
