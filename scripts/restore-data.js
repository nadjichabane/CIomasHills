#!/usr/bin/env node
/**
 * Data Restore Script
 * Restores JSON data from backup
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

console.log('🔄 Starting data restore...');

const dataDir = path.join(__dirname, '../data');
const backupDir = path.join(__dirname, '../backups');

// Check if backup directory exists
if (!fs.existsSync(backupDir)) {
  console.error('❌ No backup directory found');
  process.exit(1);
}

// Get latest backup
const backups = fs.readdirSync(backupDir)
  .filter(f => f.startsWith('backup-') && f.endsWith('.zip'))
  .sort()
  .reverse();

if (backups.length === 0) {
  console.error('❌ No backup files found');
  process.exit(1);
}

const latestBackup = path.join(backupDir, backups[0]);

try {
  // Create data directory if it doesn't exist
  if (!fs.existsSync(dataDir)) {
    fs.mkdirSync(dataDir, { recursive: true });
  }
  
  // Restore from backup
  execSync(`unzip -o ${latestBackup} -d ${dataDir}`);
  
  console.log(`✅ Data restored from: ${latestBackup}`);
  
  // List restored files
  const restoredFiles = fs.readdirSync(dataDir).filter(f => f.endsWith('.json'));
  console.log(`📊 Restored ${restoredFiles.length} JSON files:`);
  restoredFiles.forEach(file => {
    console.log(`   - ${file}`);
  });
  
} catch (error) {
  console.error('❌ Restore failed:', error.message);
  process.exit(1);
}