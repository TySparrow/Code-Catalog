<template>
    <transition name="modal-animation">
        <div v-show="modalActive" class="modal">
            <transition name="modal-animation-inner">
                <div v="modalActive" class="modal-inner">
                    <i @click="close" class="far fa-times-circle"></i>
                    <slot></slot>
                    <button class="buttons" @click="close" type="button">close</button>
                </div>
            </transition>
        </div>
    </transition>

</template>

<script>
export default{
    props: ["modalActive"],
    setup(props, {emit}){
        const close = () => {
            emit("close");
        };
        return {close};
    }
};
</script>

<style scoped>
*{
    border: thin solid ;
    border-radius: 5px;
    margin: 0;
    box-sizing: border-box;
    font-family: "Karla", sans-serif;

}
.buttons{
    
    padding: 10px 20px;
    font-size: 16px;
    background-color: red;
    color: blue;
    cursor: pointer;

    

}
</style>



