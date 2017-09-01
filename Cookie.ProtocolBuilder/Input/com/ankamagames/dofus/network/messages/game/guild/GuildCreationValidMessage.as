package com.ankamagames.dofus.network.messages.game.guild
{
   import com.ankamagames.dofus.network.types.game.guild.GuildEmblem;
   import com.ankamagames.jerakine.network.CustomDataWrapper;
   import com.ankamagames.jerakine.network.ICustomDataInput;
   import com.ankamagames.jerakine.network.ICustomDataOutput;
   import com.ankamagames.jerakine.network.INetworkMessage;
   import com.ankamagames.jerakine.network.NetworkMessage;
   import com.ankamagames.jerakine.network.utils.FuncTree;
   import flash.utils.ByteArray;
   
   [Trusted]
   public class GuildCreationValidMessage extends NetworkMessage implements INetworkMessage
   {
      
      public static const protocolId:uint = 5546;
       
      
      private var _isInitialized:Boolean = false;
      
      public var guildName:String = "";
      
      public var guildEmblem:GuildEmblem;
      
      private var _guildEmblemtree:FuncTree;
      
      public function GuildCreationValidMessage()
      {
         this.guildEmblem = new GuildEmblem();
         super();
      }
      
      override public function get isInitialized() : Boolean
      {
         return this._isInitialized;
      }
      
      override public function getMessageId() : uint
      {
         return 5546;
      }
      
      public function initGuildCreationValidMessage(param1:String = "", param2:GuildEmblem = null) : GuildCreationValidMessage
      {
         this.guildName = param1;
         this.guildEmblem = param2;
         this._isInitialized = true;
         return this;
      }
      
      override public function reset() : void
      {
         this.guildName = "";
         this.guildEmblem = new GuildEmblem();
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
         this.serializeAs_GuildCreationValidMessage(param1);
      }
      
      public function serializeAs_GuildCreationValidMessage(param1:ICustomDataOutput) : void
      {
         param1.writeUTF(this.guildName);
         this.guildEmblem.serializeAs_GuildEmblem(param1);
      }
      
      public function deserialize(param1:ICustomDataInput) : void
      {
         this.deserializeAs_GuildCreationValidMessage(param1);
      }
      
      public function deserializeAs_GuildCreationValidMessage(param1:ICustomDataInput) : void
      {
         this._guildNameFunc(param1);
         this.guildEmblem = new GuildEmblem();
         this.guildEmblem.deserialize(param1);
      }
      
      public function deserializeAsync(param1:FuncTree) : void
      {
         this.deserializeAsyncAs_GuildCreationValidMessage(param1);
      }
      
      public function deserializeAsyncAs_GuildCreationValidMessage(param1:FuncTree) : void
      {
         param1.addChild(this._guildNameFunc);
         this._guildEmblemtree = param1.addChild(this._guildEmblemtreeFunc);
      }
      
      private function _guildNameFunc(param1:ICustomDataInput) : void
      {
         this.guildName = param1.readUTF();
      }
      
      private function _guildEmblemtreeFunc(param1:ICustomDataInput) : void
      {
         this.guildEmblem = new GuildEmblem();
         this.guildEmblem.deserializeAsync(this._guildEmblemtree);
      }
   }
}
