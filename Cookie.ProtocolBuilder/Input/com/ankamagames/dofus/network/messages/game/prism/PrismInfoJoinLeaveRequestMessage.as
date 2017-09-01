package com.ankamagames.dofus.network.messages.game.prism
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class PrismInfoJoinLeaveRequestMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5844;
       
      
      private var _isInitialized:Boolean = false;
      
      public var join:Boolean = false;
      
      public function PrismInfoJoinLeaveRequestMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5844;
      }
      
      public function initPrismInfoJoinLeaveRequestMessage(param1:Boolean = false) : PrismInfoJoinLeaveRequestMessage
      {
         this.join = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.join = false;
         this._isInitialized = false;
      }
      
      override public function pack(param1:ICustomDataOutput) : void
      {
         var _loc2_:ByteArray = new ByteArray();
         this.serialize(new CustomDataWrapper(_loc2_));
         writePacket(param1,this.getMessageId(),_loc2_);
      }
      
      override public function unpack(param1:ICustomDataInput, param2:uint) : void
      {
         this.deserialize(param1);
      }
      
      override public function unpackAsync(param1:ICustomDataInput, param2:uint) : FuncTree
      {
         var _loc3_:FuncTree = new FuncTree();
         _loc3_.setRoot(param1);
         this.deserializeAsync(_loc3_);
         return _loc3_;
      }
      
      public function serialize(param1:ICustomDataOutput) : void
      {
         this.serializeAs_PrismInfoJoinLeaveRequestMessage(param1);
      }
      
      public function serializeAs_PrismInfoJoinLeaveRequestMessage(param1:ICustomDataOutput) : void
      {
         param1.writeBoolean(this.join);
      }
      
      public function deserialize(param1:ICustomDataInput) : void
      {
         this.deserializeAs_PrismInfoJoinLeaveRequestMessage(param1);
      }
      
      public function deserializeAs_PrismInfoJoinLeaveRequestMessage(param1:ICustomDataInput) : void
      {
         this._joinFunc(param1);
      }
      
      public function deserializeAsync(param1:FuncTree) : void
      {
         this.deserializeAsyncAs_PrismInfoJoinLeaveRequestMessage(param1);
      }
      
      public function deserializeAsyncAs_PrismInfoJoinLeaveRequestMessage(param1:FuncTree) : void
      {
         param1.addChild(this._joinFunc);
      }
      
      private function _joinFunc(param1:ICustomDataInput) : void
      {
         this.join = param1.readBoolean();
      }
   }
}
