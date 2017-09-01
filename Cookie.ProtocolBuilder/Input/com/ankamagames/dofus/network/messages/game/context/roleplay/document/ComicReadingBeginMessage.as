package com.ankamagames.dofus.network.messages.game.context.roleplay.document
{
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class ComicReadingBeginMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 6536;
       
      
      private var _isInitialized:Boolean = false;
      
      public var comicId:uint = 0;
      
      public function ComicReadingBeginMessage()
      {
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 6536;
      }
      
      public function initComicReadingBeginMessage(param1:uint = 0) : ComicReadingBeginMessage
      {
         this.comicId = param1;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.comicId = 0;
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
         this.serializeAs_ComicReadingBeginMessage(param1);
      }
      
      public function serializeAs_ComicReadingBeginMessage(param1:ICustomDataOutput) : void
      {
         if(this.comicId < 0)
         {
            throw new Error("Forbidden value (" + this.comicId + ") on element comicId.");
         }
         param1.writeVarShort(this.comicId);
      }
      
      public function deserialize(param1:ICustomDataInput) : void
      {
         this.deserializeAs_ComicReadingBeginMessage(param1);
      }
      
      public function deserializeAs_ComicReadingBeginMessage(param1:ICustomDataInput) : void
      {
         this._comicIdFunc(param1);
      }
      
      public function deserializeAsync(param1:FuncTree) : void
      {
         this.deserializeAsyncAs_ComicReadingBeginMessage(param1);
      }
      
      public function deserializeAsyncAs_ComicReadingBeginMessage(param1:FuncTree) : void
      {
         param1.addChild(this._comicIdFunc);
      }
      
      private function _comicIdFunc(param1:ICustomDataInput) : void
      {
         this.comicId = param1.readVarUhShort();
         if(this.comicId < 0)
         {
            throw new Error("Forbidden value (" + this.comicId + ") on element of ComicReadingBeginMessage.comicId.");
         }
      }
   }
}
