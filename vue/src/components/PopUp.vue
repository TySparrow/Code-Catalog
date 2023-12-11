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
    border-radius: 5px;
    margin: 0;
    box-sizing: border-box;
    font-family: "Karla", sans-serif;

}
.buttons{
    
    padding: 10px 20px;
    margin-bottom:2px;
    font-size: 16px;
    background-color: #c0c0c0;
    color: blue;
    cursor: pointer;
}

.modal {
    margin: auto;
    position: fixed;
    border: thin solid;
    margin-left: 30%;
    margin-right: 30%;
    background-color: white;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    
}
.modal-inner {
    text-align: center;
    
}
</style>



