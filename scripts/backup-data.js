#!/usr/bin/env node
/**
 * Data Backup Script
 * Backs up JSON data files
 */

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

console.log('💾 Starting data backup...');

const dataDir = path.join(__dirname, '../data');
const backupDir = path.join(__dirname, '../backups');

// Create backup directory if it doesn't exist
if (!fs.existsSync(backupDir)) {
  fs.mkdirSync(backupDir, { recursive: true });
}

// Get current timestamp
const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
const backupFile = path.join(backupDir, `backup-${timestamp}.zip`);

try {
  // Create zip backup
  execSync(`cd ${dataDir} && zip -r ${backupFile} ./*.json`);
  
  const files = fs.readdirSync(dataDir).filter(f => f.endsWith('.json'));
  console.log(`✅ Backup completed: ${files.length} JSON files backed up to ${backupFile}`);
  
  // Keep only last 5 backups
  const backups = fs.readdirSync(backupDir)
    .filter(f => f.startsWith('backup-') && f.endsWith('.zip'))
    .sort()
    .reverse();
    
  if (backups.length > 5) {
    const toDelete = backups.slice(5);
    toDelete.forEach(file => {
      fs.unlinkSync(path.join(backupDir, file));
      console.log(`🗑️  Deleted old backup: ${file}`);
    });
  }
  
} catch (error) {
  console.error('❌ Backup failed:', error.message);
  process.exit(1);
}